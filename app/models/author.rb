# frozen_string_literal: true

class Author < ApplicationRecord
  # attr_accessible :name, :language_id, :grandham_id, :profile_pictures_attributes

  belongs_to :language, optional: true

  has_many :authorships
  has_many :books, through: :authorships

  has_many :edits, as: :editable

  has_many :profile_pictures, as: :imageable
  accepts_nested_attributes_for :profile_pictures

  validates :name, presence: true

  before_create :set_grandham_id
  after_create :set_default_profile_picture

  searchable do
    text :name
  end

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
