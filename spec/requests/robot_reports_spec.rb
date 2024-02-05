require "rails_helper"

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/robot_reports", type: :request do
  # This should return the minimal set of attributes required to create a valid
  # RobotReport. As you add validations to RobotReport, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    {file: fixture_file_upload("example-robot.json")}
  }
  let(:invalid_attributes) {
    {file: fixture_file_upload("example-customer.csv")}
  }

  describe "GET /index" do
    let!(:robot_report) { create(:robot_report) }

    it "renders a successful response" do
      get robot_reports_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    let(:robot_report) { create(:robot_report) }

    it "renders a successful response" do
      get robot_report_url(robot_report)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_robot_report_url
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new RobotReport" do
        expect {
          post robot_reports_url, params: {robot_report: valid_attributes}
        }.to change(RobotReport, :count).by(1)
      end

      it "redirects to the created robot_report" do
        post robot_reports_url, params: {robot_report: valid_attributes}
        expect(response).to redirect_to(robot_report_url(RobotReport.last))
      end
    end

    context "with invalid parameters" do
      context "without a file" do
        let(:invalid_attributes) { {} }

        it "does not create a new RobotReport" do
          expect {
            post robot_reports_url, params: {robot_report: invalid_attributes}
          }.to change(RobotReport, :count).by(0)
        end

        it "renders a response with 422 status (i.e. to display the 'new' template)" do
          post robot_reports_url, params: {robot_report: invalid_attributes}
          expect(response).to have_http_status(:unprocessable_entity)
        end
      end

      it "does not create a new RobotReport" do
        expect {
          post robot_reports_url, params: {robot_report: invalid_attributes}
        }.to change(RobotReport, :count).by(0)
      end

      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post robot_reports_url, params: {robot_report: invalid_attributes}
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
