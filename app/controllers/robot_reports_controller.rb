class RobotReportsController < ApplicationController
  skip_before_action :verify_authenticity_token

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
    @robot_report = if request.format.json?
      RobotReport.new(file: {io: StringIO.new(request.raw_post), filename: "#{Date.today}_report.json"})
    else
      RobotReport.new(robot_report_params)
    end

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
    params.permit(robot_report: :file)[:robot_report]
  end
end
