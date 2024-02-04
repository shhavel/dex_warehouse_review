# frozen_string_literal: true

FactoryBot.define do
  factory :csv_file do
    file { Rack::Test::UploadedFile.new("spec/fixtures/files/example-customer.csv") }
  end
end
