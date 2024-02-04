class CSVFilesController < ApplicationController
  before_action :set_csv_file, only: %i[show edit update destroy]

  # GET /csv_files or /csv_files.json
  def index
    @csv_files = CSVFile.all
  end

  # GET /csv_files/1 or /csv_files/1.json
  def show
  end

  # GET /csv_files/new
  def new
    @csv_file = CSVFile.new
  end

  # GET /csv_files/1/edit
  def edit
  end

  # POST /csv_files or /csv_files.json
  def create
    @csv_file = CSVFile.new(csv_file_params)

    respond_to do |format|
      if @csv_file.save
        format.html { redirect_to root_url, notice: "CSV file was successfully created." }
        format.json { render :show, status: :created, location: @csv_file }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @csv_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /csv_files/1 or /csv_files/1.json
  def update
    respond_to do |format|
      if @csv_file.update(csv_file_params)
        format.html { redirect_to csv_file_url(@csv_file), notice: "CSV file was successfully updated." }
        format.json { render :show, status: :ok, location: @csv_file }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @csv_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /csv_files/1 or /csv_files/1.json
  def destroy
    @csv_file.destroy!

    respond_to do |format|
      format.html { redirect_to csv_files_url, notice: "CSV file was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_csv_file
    @csv_file = CSVFile.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def csv_file_params
    params.require(:csv_file).permit(:name, :file)
  end
end
