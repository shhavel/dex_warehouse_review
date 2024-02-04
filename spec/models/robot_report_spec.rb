require "rails_helper"

RSpec.describe RobotReport, type: :model do
  let(:robot_report) { create(:robot_report, created_at: DateTime.parse("2024-02-04 23:14:06 UTC")) }

  describe "#name" do
    subject(:name) { robot_report.name }

    it "generates descriptive name including record creation date and uploaded file name" do
      is_expected.to eq "Sun, 04 Feb 2024 example-robot.json"
    end
  end

  describe "#report" do
    subject(:report) { robot_report.report }

    it "returns dictionary of locations from parsed JSON file" do
      is_expected.to be_a Hash
      expect(report.count).to eq 999
      expect(report["ZA001A"].scanned).to eq true
      expect(report["ZA001A"].occupied).to eq true
      expect(report["ZA001A"].detected_barcodes).to eq ["DX9850004338"]
    end
  end
end
