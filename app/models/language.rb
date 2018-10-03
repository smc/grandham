# frozen_string_literal: true

class Language < ApplicationRecord
  has_many :books
  has_many :authors
  has_many :publishers
  has_many :libraries

  has_many :books
  has_many :edits
  has_many :new_items
  has_many :users

  def to_param
    short_code
  end

  def self.default
    where(default: true).first
  end
end
