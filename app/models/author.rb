class Author < ActiveRecord::Base
  attr_accessible :name, :language_id, :grandham_id

  belongs_to :language

  has_many :authorships
  has_many :books, through: :authorships

  has_many :edits, as: :editable

  has_many :profile_pictures, as: :imageable
  accepts_nested_attributes_for :profile_pictures

  validates_presence_of :name

  before_create :set_grandham_id
  after_create :set_default_profile_picture

  # searchable do
  #   text :name
  # end

  def to_param
    grandham_id
  end

  private

  def set_default_profile_picture
    self.profile_pictures.create if self.profile_pictures.empty?
  end

  def set_grandham_id
    self.grandham_id = SecureRandom.hex(4)
  end
end