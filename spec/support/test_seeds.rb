# frozen_string_literal: true

class TestSeeds
  def self.seed!
    FactoryBot.create(:language, default: true)
  end
end
