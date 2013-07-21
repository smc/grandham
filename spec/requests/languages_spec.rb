require 'spec_helper'

describe "Languages" do
  describe "GET /languages" do
    it "works!" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get languages_path
      response.status.should be(200)
    end
  end
end
