require "rails_helper"

RSpec.describe "Dashboards", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/dashboard/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /compare" do
    let(:csv_file) { create(:csv_file, created_at: DateTime.parse("2024-02-04 23:14:06 UTC")) }
    let(:robot_report) { create(:robot_report, created_at: DateTime.parse("2024-02-04 23:14:06 UTC")) }

    it "returns http success" do
      get "/dashboard/compare", params: {csv_file_id: csv_file.id, robot_report_id: robot_report.id}
      expect(response).to have_http_status(:success)
    end

    it "displays correlation table" do
      get "/dashboard/compare", params: {csv_file_id: csv_file.id, robot_report_id: robot_report.id}
      expect(response).to have_http_status(:success)
      expect(response.body).to include(<<-HTML)
        <tr class="bg-green-50">
          <td class="px-6 py-3 whitespace-nowrap">ZE015C</td>
          <td class="px-6 py-3 whitespace-nowrap text-center">👀</td>
          <td class="px-6 py-3 whitespace-nowrap text-center">📭</td>
          <td class="px-6 py-3 whitespace-nowrap"></td>
          <td class="px-6 py-3 whitespace-nowrap"></td>
          <td class="px-6 py-3 whitespace-nowrap">The location was empty, as expected</td>
        </tr>
        <tr class="bg-green-50">
          <td class="px-6 py-3 whitespace-nowrap">ZE016C</td>
          <td class="px-6 py-3 whitespace-nowrap text-center">👀</td>
          <td class="px-6 py-3 whitespace-nowrap text-center">📦</td>
          <td class="px-6 py-3 whitespace-nowrap">DX9850005069</td>
          <td class="px-6 py-3 whitespace-nowrap">DX9850005069</td>
          <td class="px-6 py-3 whitespace-nowrap">The location was occupied by the expected items</td>
        </tr>
      HTML
    end
  end
end
