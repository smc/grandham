# frozen_string_literal: true

class Library < ApplicationRecord
  belongs_to :language

  has_many :availabilities, dependent: :destroy
  has_many :books, through: :availabilities

  has_many :edits, as: :editable, dependent: :destroy

  has_many :logos, as: :imageable, dependent: :destroy
  accepts_nested_attributes_for :logos

  before_create :set_grandham_id
  after_create :set_default_logo

  searchkick word: [:name]

  def to_param
    grandham_id
  end

  private

  def set_default_logo
    logos.create if logos.empty?
  end

  def set_grandham_id
    self.grandham_id = SecureRandom.hex(4)
  end
end
