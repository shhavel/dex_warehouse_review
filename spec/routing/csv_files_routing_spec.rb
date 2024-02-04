require "rails_helper"

RSpec.describe CSVFilesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/csv_files").to route_to("csv_files#index")
    end

    it "routes to #new" do
      expect(get: "/csv_files/new").to route_to("csv_files#new")
    end

    it "routes to #show" do
      expect(get: "/csv_files/1").to route_to("csv_files#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/csv_files/1/edit").to route_to("csv_files#edit", id: "1")
    end

    it "routes to #create" do
      expect(post: "/csv_files").to route_to("csv_files#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/csv_files/1").to route_to("csv_files#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/csv_files/1").to route_to("csv_files#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/csv_files/1").to route_to("csv_files#destroy", id: "1")
    end
  end
end
