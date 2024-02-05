class CSVFilesController < ApplicationController
  layout false

  # GET /csv_files
  def index
    @csv_files = CSVFile.order(id: :desc)
  end

  # GET /csv_files/new
  def new
    @csv_file = CSVFile.new
  end

  # POST /csv_files
  def create
    @csv_file = CSVFile.new(csv_file_params)

    if @csv_file.save
      @csv_files = CSVFile.order(id: :desc)
      render :index
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  # Only allow a list of trusted parameters through.
  def csv_file_params
    params.permit(csv_file: :file)[:csv_file]
  end
end
