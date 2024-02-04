require "rails_helper"

RSpec.describe "csv_files/show", type: :view do
  before(:each) do
    assign(:csv_file, CSVFile.create!(
      name: "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
  end
end
