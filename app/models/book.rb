class Book < ActiveRecord::Base
  attr_accessible :grandham_id, :language_id

  belongs_to :language
  has_one :approved_submission, class_name: 'BookSubmission', conditions: ['approved = true']
  has_many :submissions, class_name: 'BookSubmission'

  before_create :set_grandham_id

  private

  def set_grandham_id
    self.grandham_id = SecureRandom.hex(16)
  end
end
