require "rails_helper"

RSpec.describe "csv_files/index", type: :view do
  before(:each) do
    assign(:csv_files, [
      CSVFile.create!(
        name: "Name"
      ),
      CSVFile.create!(
        name: "Name"
      )
    ])
  end

  it "renders a list of csv_files" do
    render
    cell_selector = (Rails::VERSION::STRING >= "7") ? "div>p" : "tr>td"
    assert_select cell_selector, text: Regexp.new("Name".to_s), count: 2
  end
end
