json.extract! csv_file, :id, :name, :created_at, :updated_at
json.url csv_file_url(csv_file, format: :json)
