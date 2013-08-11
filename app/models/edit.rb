class Edit < ActiveRecord::Base
  attr_accessible :approved, :approved_by_user_id, :field, :new_value, :old_value, :status, :user_id

  belongs_to :editable, polymorphic: true
end
