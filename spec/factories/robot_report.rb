# frozen_string_literal: true

FactoryBot.define do
  factory :robot_report do
    file { Rack::Test::UploadedFile.new("spec/fixtures/files/example-robot.json") }
  end
end
