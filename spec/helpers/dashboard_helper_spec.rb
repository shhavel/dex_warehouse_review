require "rails_helper"

# Specs in this file have access to a helper object that includes
# the DashboardHelper. For example:
#
# describe DashboardHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe DashboardHelper, type: :helper do
  describe "#location_report_row_class" do
    subject { helper.location_report_row_class(location) }

    context "with location category :ok" do
      let(:location) { double("Location", category: :ok) }

      it { should eq "bg-green-50" }
    end

    context "with location category :no_data" do
      let(:location) { double("Location", category: :no_data) }

      it { should eq "bg-yellow-50" }
    end

    context "with location category :discrepancy" do
      let(:location) { double("Location", category: :discrepancy) }

      it { should eq "bg-red-50" }
    end
  end
end
