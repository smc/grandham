# frozen_string_literal: true

class NewItem < ApplicationRecord
  # attr_accessible :reviewed_by_user_id, :language_id, :state, :user_id

  belongs_to :creatable, polymorphic: true

  scope :not_reviewed, where(state: 'open')

  belongs_to :user
  belongs_to :language
end
