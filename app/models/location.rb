# frozen_string_literal: true

Location = Struct.new("Location", :location, :item, :report_location, keyword_init: true) do
  delegate :scanned, :occupied, :detected_barcodes, to: :report_location, allow_nil: true

  CATEGORY_SEVERITY = {ok: "info", no_data: "warning", discrepancy: "error"}.transform_values do |str|
    ActiveSupport::StringInquirer.new(str)
  end.freeze

  def comparison_outcome
    @comparison_outcome ||= if report_location.nil?
      :not_found
    elsif !scanned
      :not_scanned
    elsif item.nil? && !occupied
      :empty_empty
    elsif item.nil?
      :empty_occupied
    elsif !occupied
      :item_missing
    elsif detected_barcodes.empty?
      :item_unidentified
    elsif detected_barcodes.one? && item == detected_barcodes[0]
      :item_ok
    elsif item.in?(detected_barcodes)
      :item_extra
    else
      :item_wrong
    end
  end

  def category
    @category ||= if comparison_outcome.in?(%i[not_found not_scanned item_unidentified])
      :no_data
    elsif comparison_outcome.in?(%i[empty_empty item_ok])
      :ok
    else
      :discrepancy
    end
  end

  def severity
    @severity ||= CATEGORY_SEVERITY[category]
  end
end
