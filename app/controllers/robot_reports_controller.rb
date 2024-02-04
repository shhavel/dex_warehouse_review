class RobotReportsController < ApplicationController
  before_action :set_robot_report, only: %i[show edit update destroy]

  # GET /robot_reports or /robot_reports.json
  def index
    @robot_reports = RobotReport.all
  end

  # GET /robot_reports/1 or /robot_reports/1.json
  def show
  end

  # GET /robot_reports/new
  def new
    @robot_report = RobotReport.new
  end

  # GET /robot_reports/1/edit
  def edit
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

  # PATCH/PUT /robot_reports/1 or /robot_reports/1.json
  def update
    respond_to do |format|
      if @robot_report.update(robot_report_params)
        format.html { redirect_to robot_report_url(@robot_report), notice: "Robot report was successfully updated." }
        format.json { render :show, status: :ok, location: @robot_report }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @robot_report.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /robot_reports/1 or /robot_reports/1.json
  def destroy
    @robot_report.destroy!

    respond_to do |format|
      format.html { redirect_to robot_reports_url, notice: "Robot report was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_robot_report
    @robot_report = RobotReport.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def robot_report_params
    params.require(:robot_report).permit(:name, :file)
  end
end
