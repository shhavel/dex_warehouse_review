require "rails_helper"

RSpec.describe "csv_files/new", type: :view do
  before(:each) do
    assign(:csv_file, CSVFile.new(
      name: "MyString"
    ))
  end

  it "renders new csv_file form" do
    render

    assert_select "form[action=?][method=?]", csv_files_path, "post" do
      assert_select "input[name=?]", "csv_file[name]"
    end
  end
end
