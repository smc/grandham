# frozen_string_literal: true

class TestSeeds
  def self.seed!
    FactoryGirl.create(:language, default: true)
  end
end
