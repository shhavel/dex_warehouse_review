require "rails_helper"

RSpec.describe "robot_reports/new", type: :view do
  before(:each) do
    assign(:robot_report, RobotReport.new(
      name: "MyString"
    ))
  end

  it "renders new robot_report form" do
    render

    assert_select "form[action=?][method=?]", robot_reports_path, "post" do
      assert_select "input[name=?]", "robot_report[name]"
    end
  end
end
