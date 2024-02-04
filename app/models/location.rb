# frozen_string_literal: true

Location = Struct.new("Location", :location, :item, :report_location, keyword_init: true) do
  delegate :scanned, :occupied, :detected_barcodes, to: :report_location, allow_nil: true

  const_set(:OUTCOME_CATEGORY, {
    not_found: :no_data,
    not_scanned: :no_data,
    item_unidentified: :no_data,
    empty_empty: :ok,
    item_ok: :ok
  }.tap { |h| h.default = :discrepancy }.freeze)
  const_set(:CATEGORY_SEVERITY, {ok: "info", no_data: "warning", discrepancy: "error"}.transform_values do |str|
    ActiveSupport::StringInquirer.new(str)
  end.freeze)

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
    @category ||= OUTCOME_CATEGORY[comparison_outcome]
  end

  def severity
    @severity ||= CATEGORY_SEVERITY[category]
  end
end
