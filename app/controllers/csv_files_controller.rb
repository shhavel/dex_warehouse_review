class CSVFilesController < ApplicationController
  layout :false

  # GET /csv_files or /csv_files.json
  def index
    @csv_files = CSVFile.order(id: :desc)
  end

  # GET /csv_files/new
  def new
    @csv_file = CSVFile.new
  end

  # POST /csv_files or /csv_files.json
  def create
    @csv_file = CSVFile.new(csv_file_params)

    if @csv_file.save
      @csv_files = CSVFile.order(id: :desc)
      render :index
    else
      render :new
    end
  end

  private

  # Only allow a list of trusted parameters through.
  def csv_file_params
    params.require(:csv_file).permit(:file)
  end
end
