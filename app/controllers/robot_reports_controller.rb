class RobotReportsController < ApplicationController
  # GET /robot_reports or /robot_reports.json
  def index
    @robot_reports = RobotReport.all
  end

  # GET /robot_reports/1 or /robot_reports/1.json
  def show
    @robot_report = RobotReport.find(params[:id])
  end

  # GET /robot_reports/new
  def new
    @robot_report = RobotReport.new
  end

  # POST /robot_reports or /robot_reports.json
  def create
    @robot_report = RobotReport.new(robot_report_params)

    respond_to do |format|
      if @robot_report.save
        format.html { redirect_to robot_report_url(@robot_report), notice: "Robot report was successfully created." }
        format.json { render :show, status: :created, location: @robot_report }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @robot_report.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  # Only allow a list of trusted parameters through.
  def robot_report_params
    params.require(:robot_report).permit(:file)
  end
end
