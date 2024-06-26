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

RSpec.describe "/csv_files", type: :request do
  # This should return the minimal set of attributes required to create a valid
  # CSVFile. As you add validations to CSVFile, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    {file: fixture_file_upload("example-customer.csv")}
  }

  let(:invalid_attributes) {
    {file: fixture_file_upload("example-robot.json")}
  }

  describe "GET /index" do
    it "renders a successful response" do
      CSVFile.create! valid_attributes
      get csv_files_url
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_csv_file_url
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new CSVFile" do
        expect {
          post csv_files_url, params: {csv_file: valid_attributes}
        }.to change(CSVFile, :count).by(1)
      end

      it "redirects to the created csv_file" do
        post csv_files_url, params: {csv_file: valid_attributes}
        # expect(response).to redirect_to(csv_file_url(CSVFile.last))
      end
    end

    context "with invalid parameters" do
      context "without a file" do
        let(:invalid_attributes) { {} }

        it "does not create a new CSVFile" do
          expect {
            post csv_files_url, params: {csv_file: invalid_attributes}
          }.to change(CSVFile, :count).by(0)
        end

        it "renders a response with 422 status (i.e. to display the 'new' template)" do
          post robot_reports_url, params: {csv_file: invalid_attributes}
          expect(response).to have_http_status(:unprocessable_entity)
        end
      end

      it "does not create a new CSVFile" do
        expect {
          post csv_files_url, params: {csv_file: invalid_attributes}
        }.to change(CSVFile, :count).by(0)
      end

      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post csv_files_url, params: {csv_file: invalid_attributes}
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
