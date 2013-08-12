class Publisher < ActiveRecord::Base
  attr_accessible :name, :language_id, :grandham_id, :place

  belongs_to :language

  validates_presence_of :name

  has_many :publications
  has_many :books, through: :publications

  has_many :edits, as: :editable

  before_create :set_grandham_id

  def to_param
    grandham_id
  end

  private

  def set_grandham_id
    self.grandham_id = SecureRandom.hex(4)
  end
end