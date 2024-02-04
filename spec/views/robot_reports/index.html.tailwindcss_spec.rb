require "rails_helper"

RSpec.describe "robot_reports/index", type: :view do
  before(:each) do
    assign(:robot_reports, [
      RobotReport.create!(
        name: "Name"
      ),
      RobotReport.create!(
        name: "Name"
      )
    ])
  end

  it "renders a list of robot_reports" do
    render
    cell_selector = (Rails::VERSION::STRING >= "7") ? "div>p" : "tr>td"
    assert_select cell_selector, text: Regexp.new("Name".to_s), count: 2
  end
end
