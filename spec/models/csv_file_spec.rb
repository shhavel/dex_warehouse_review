require "rails_helper"

RSpec.describe CSVFile, type: :model do
  let(:csv_file) { create(:csv_file, created_at: DateTime.parse("2024-02-04 23:14:06 UTC")) }

  describe "#name" do
    subject(:name) { csv_file.name }

    it "generates descriptive name including record creation date and uploaded file name" do
      is_expected.to eq "Sun, 04 Feb 2024 example-customer.csv"
    end
  end

  describe "#locations" do
    subject(:locations) { csv_file.locations }

    it "returns list of locations based on parsed CSV rows" do
      expect(locations.count).to eq 999
      expect(locations[0].location).to eq "ZA001A"
      expect(locations[0].item).to eq "DX9850004338"
    end
  end

  describe "#compare_with" do
    subject(:locations) { csv_file.locations }
    let(:robot_report) { create(:robot_report) }
    before { csv_file.compare_with(robot_report.report) }

    it "updates locations with corresponding data from robot report" do
      expect(locations[0].scanned).to eq true
      expect(locations[0].occupied).to eq true
      expect(locations[0].detected_barcodes).to eq ["DX9850004338"]
    end

    it "fills in location outcome status" do
      expect(locations[0].status).to eq :item_ok
      expect(locations[1].status).to eq :empty_empty
      expect(locations.find { |location| location.location == "ZB001A" }.status).to eq :not_scanned
      expect(locations.find { |location| location.location == "ZC002A" }.status).to eq :item_missing
      expect(locations.find { |location| location.location == "ZC001B" }.status).to eq :empty_occupied
    end

    it "fills in location category" do
      expect(locations[0].category).to eq :ok
    end

    it "adds decorated data" do
      expect(locations[0].scanned_emoji).to eq "👀"
      expect(locations[0].occupied_emoji).to eq "📦"
      expect(locations[0].detected_items).to eq "DX9850004338"
      expect(locations[0].report_row).to eq [
        "ZA001A",
        "👀",
        "📦",
        "DX9850004338",
        "DX9850004338",
        "The location was occupied by the expected items"
      ]
    end
  end
end
