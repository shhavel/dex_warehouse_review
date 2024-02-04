class DashboardController < ApplicationController
  before_action do
    @csv_files = CSVFile.order(id: :desc)
    @robot_reports = RobotReport.order(id: :desc)
  end

  def index
  end

  def compare
    @csv_file = CSVFile.find(params[:csv_file_id])
    report = RobotReport.find(params[:robot_report_id]).report
    @csv_file.compare_with(report)
  end
end
