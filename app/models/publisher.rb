class Publisher < ActiveRecord::Base
  attr_accessible :name, :language_id, :grandham_id, :place

  belongs_to :language

  validates_presence_of :name

  has_many :publications
  has_many :books, through: :publications

  has_many :edits, as: :editable

  has_many :logos, as: :imageable
  accepts_nested_attributes_for :logos

  before_create :set_grandham_id
  after_create :set_default_logo

  def to_param
    grandham_id
  end

  private

  def set_default_logo
    self.logos.create if self.logos.empty?
  end

  def set_grandham_id
    self.grandham_id = SecureRandom.hex(4)
  end
end