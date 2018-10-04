# frozen_string_literal: true

class Author < ApplicationRecord
  belongs_to :language, optional: true

  has_many :authorships
  has_many :books, through: :authorships

  has_many :edits, as: :editable

  has_many :profile_pictures, as: :imageable
  accepts_nested_attributes_for :profile_pictures

  validates :name, presence: true

  before_create :set_grandham_id
  after_create :set_default_profile_picture

  searchkick word: [:name]

  def to_param
    grandham_id
  end

  private

  def set_default_profile_picture
    profile_pictures.create if profile_pictures.empty?
  end

  def set_grandham_id
    self.grandham_id = SecureRandom.hex(4)
  end
end
