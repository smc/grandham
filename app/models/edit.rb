class Edit < ActiveRecord::Base
  attr_accessible :reviewed_by_user_id, :field, :new_value, :old_value, :state, :user_id, :language_id, :book_id

  belongs_to :editable, polymorphic: true
  belongs_to :language

  scope :not_reviewed, where(state: 'open')
  scope :approved, where(state: 'approved')

  belongs_to :book
  belongs_to :user
end
