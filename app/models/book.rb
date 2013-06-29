class Book < ActiveRecord::Base
  attr_accessible :grandham_id, :language_id

  belongs_to :language
  has_one :approved_submission, class_name: 'Submission', conditions: ['approved = true']
  has_many :submissions

  before_create :set_grandham_id

  def to_param
    grandham_id
  end

  private

  def set_grandham_id
    self.grandham_id = SecureRandom.hex(8)
  end

end
