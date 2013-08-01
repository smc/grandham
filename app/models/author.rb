class Author < ActiveRecord::Base
  attr_accessible :name, :language_id, :grandham_id

  belongs_to :language

  has_many :authorships
  has_many :submissions, through: :authorships

  before_create :set_grandham_id

  def to_param
    grandham_id
  end

  private

  def set_grandham_id
    self.grandham_id = SecureRandom.hex(4)
  end
end