class Author < ActiveRecord::Base
  attr_accessible :name, :language_id, :grandham_id

  belongs_to :language

  has_many :authorships
  has_many :books, through: :authorships

  has_many :edits, as: :editable

  validates_presence_of :name

  before_create :set_grandham_id

  searchable do
    text :name
  end

  def to_param
    grandham_id
  end

  private

  def set_grandham_id
    self.grandham_id = SecureRandom.hex(4)
  end
end