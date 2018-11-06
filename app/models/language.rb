# frozen_string_literal: true

class Language < ApplicationRecord
  has_many :books, dependent: :destroy
  has_many :authors, dependent: :destroy
  has_many :publishers, dependent: :destroy
  has_many :libraries, dependent: :destroy

  has_many :books, dependent: :destroy
  has_many :edits, dependent: :destroy
  has_many :new_items, dependent: :destroy
  has_many :users, dependent: :destroy

  def to_param
    short_code
  end

  def self.default
    find_by(default: true)
  end
end
