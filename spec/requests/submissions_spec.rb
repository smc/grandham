require 'spec_helper'

describe "Submissions" do
  describe "GET /submissions" do
    it "works!" do
      get submissions_path
      response.status.should be(200)
    end
  end
end
