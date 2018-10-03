# frozen_string_literal: true

class Edit < ApplicationRecord
  belongs_to :editable, polymorphic: true
  belongs_to :language

  scope :not_reviewed, -> { where(state: 'open') }
  scope :approved, -> { where(state: 'approved') }

  belongs_to :book
  belongs_to :user
end
