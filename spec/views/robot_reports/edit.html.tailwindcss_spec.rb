require "rails_helper"

RSpec.describe "robot_reports/edit", type: :view do
  let(:robot_report) {
    RobotReport.create!(
      name: "MyString"
    )
  }

  before(:each) do
    assign(:robot_report, robot_report)
  end

  it "renders the edit robot_report form" do
    render

    assert_select "form[action=?][method=?]", robot_report_path(robot_report), "post" do
      assert_select "input[name=?]", "robot_report[name]"
    end
  end
end
