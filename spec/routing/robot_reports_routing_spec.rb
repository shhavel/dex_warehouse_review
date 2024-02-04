require "rails_helper"

RSpec.describe RobotReportsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/robot_reports").to route_to("robot_reports#index")
    end

    it "routes to #new" do
      expect(get: "/robot_reports/new").to route_to("robot_reports#new")
    end

    it "routes to #show" do
      expect(get: "/robot_reports/1").to route_to("robot_reports#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/robot_reports/1/edit").to route_to("robot_reports#edit", id: "1")
    end

    it "routes to #create" do
      expect(post: "/robot_reports").to route_to("robot_reports#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/robot_reports/1").to route_to("robot_reports#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/robot_reports/1").to route_to("robot_reports#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/robot_reports/1").to route_to("robot_reports#destroy", id: "1")
    end
  end
end
