# frozen_string_literal: true

class RobotReport < ApplicationRecord
  has_one_attached :file, dependent: :destroy
  validates :file, presence: true, blob: {content_type: ["application/json"]}

  ReportLocation = Struct.new("ReportLocation", :name, :scanned, :occupied, :detected_barcodes, keyword_init: true)

  def name
    "#{created_at.to_date.inspect} #{file.blob.filename}"
  end

  def report
    @report ||= locations.index_by(&:name)
  end

  private

  def parsed_data
    JSON.parse(file.download, symbolize_names: true)
  end

  def locations
    parsed_data.map { |row| ReportLocation.new(row) }
  end
end
