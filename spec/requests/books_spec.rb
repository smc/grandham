# frozen_string_literal: true

require "spec_helper"

describe "Books" do
  describe "GET /books" do
    it "works!" do
      get books_path
      expect(response.status).to be(200)
    end
  end
end
