# frozen_string_literal: true

class LocationCorrelatableDecorator < SimpleDelegator
  def scanned_emoji
    scanned ? "👀" : "⚠️"
  end

  def occupied_emoji
    occupied ? "📦" : ("📭" unless occupied.nil?)
  end

  def detected_items
    detected_barcodes&.join(", ")
  end

  def report_row
    [
      location,
      scanned_emoji,
      occupied_emoji,
      item,
      detected_items,
      I18n.t("location_comparison_outcome.#{comparison_outcome}")
    ]
  end
end
