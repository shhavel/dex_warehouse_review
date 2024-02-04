# frozen_string_literal: true

Location = Struct.new("Location", :location, :item, :report_location, keyword_init: true) do
  include LocationCorrelatable
end
