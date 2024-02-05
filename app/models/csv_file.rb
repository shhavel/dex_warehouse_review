# frozen_string_literal: true

require "csv"

class CSVFile < ApplicationRecord
  has_one_attached :file, dependent: :destroy
  validates :file, presence: true, blob: {content_type: ["text/csv"]}

  attr_reader :category_count

  def name
    "#{created_at.to_date.inspect} #{file.blob.filename}"
  end

  def locations
    @locations ||= rows.map { |row| Location.new(row.to_h).decorate }
  end

  def compare_with(report)
    @category_count = Hash.new(0)
    locations.each do |location|
      location.report_location = report[location.location]
      category_count[location.category] += 1
    end
  end

  private

  def rows
    CSV.parse(file.download, headers: true, header_converters: proc { |h| h.downcase.to_sym })
  end
end
