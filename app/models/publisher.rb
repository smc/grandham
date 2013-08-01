class Publisher < ActiveRecord::Base
  attr_accessible :name, :language_id, :grandham_id

  belongs_to :language

  has_many :publications
  has_many :submissions, through: :publications

  before_create :set_grandham_id

  def to_param
    grandham_id
  end

  private

  def set_grandham_id
    self.grandham_id = SecureRandom.hex(4)
  end
end