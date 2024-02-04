# frozen_string_literal: true

class RobotReport < ApplicationRecord
  has_one_attached :file, dependent: :destroy

  Location = Struct.new("ReportLocation", :name, :scanned, :occupied, :detected_barcodes, keyword_init: true)

  def locations
    JSON.parse(file.download, symbolize_names: true).map { |row| Location.new(row) }
  end

  def report
    @report ||= locations.index_by(&:name)
  end

  def name
    "#{created_at.to_date.inspect} #{file.blob.filename}"
  end
end
