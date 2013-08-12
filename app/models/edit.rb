class Edit < ActiveRecord::Base
  attr_accessible :approved_by_user_id, :field, :new_value, :old_value, :status, :user_id, :language_id

  belongs_to :editable, polymorphic: true
  belongs_to :language

  scope :not_reviewed, where(state: 'open')
end
