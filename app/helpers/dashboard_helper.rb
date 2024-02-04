# frozen_string_literal: true

module DashboardHelper
  LOCATION_REPORT_ROW_CLASS = {
    ok: "bg-green-50",
    no_data: "bg-yellow-50",
    discrepancy: "bg-red-50"
  }.freeze

  def location_report_row_class(location)
    LOCATION_REPORT_ROW_CLASS[location.comparison_category]
  end
end
