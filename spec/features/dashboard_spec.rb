require "rails_helper"

RSpec.describe "Dashboards", type: :feature do
  let!(:robot_report) { create(:robot_report, created_at: DateTime.parse("2024-02-05 01:00:00 UTC")) }

  describe "GET /index" do
    it "allows to upload CSV file", js: true do
      visit "/dashboard/index"
      click_link "Upload new CSV file"

      expect(page).to have_button "Upload CSV"
    end

    it "generates correlation report", js: true do
      visit "/dashboard/index"
      click_link "Upload new CSV file"
      attach_file("csv_file[file]", "spec/fixtures/files/example-customer.csv")
      click_button "Upload CSV"
      select "Mon, 05 Feb 2024 example-robot.json", from: "robot_report_id"
      click_button "Compare"

      expect(page).to have_content "✅ OK"
      expect(page).to have_content "758"
      expect(page).to have_content "LOCATION NAME"
      expect(page).to have_content "ZA001A"
      expect(page).to have_content "OUTCOME"
      expect(page).to have_content "The location was occupied by the expected items"
    end
  end
end
