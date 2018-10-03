# frozen_string_literal: true

class Publisher < ApplicationRecord
  belongs_to :language, optional: true

  validates :name, presence: true

  has_many :publications
  has_many :books, through: :publications

  has_many :edits, as: :editable

  has_many :logos, as: :imageable
  accepts_nested_attributes_for :logos

  before_create :set_grandham_id
  after_create :set_default_logo

  searchable do
    text :name
  end

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
