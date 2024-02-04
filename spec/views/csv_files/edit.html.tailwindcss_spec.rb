require "rails_helper"

RSpec.describe "csv_files/edit", type: :view do
  let(:csv_file) {
    CSVFile.create!(
      name: "MyString"
    )
  }

  before(:each) do
    assign(:csv_file, csv_file)
  end

  it "renders the edit csv_file form" do
    render

    assert_select "form[action=?][method=?]", csv_file_path(csv_file), "post" do
      assert_select "input[name=?]", "csv_file[name]"
    end
  end
end
