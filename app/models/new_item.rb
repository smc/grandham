# frozen_string_literal: true

class NewItem < ApplicationRecord
  belongs_to :creatable, polymorphic: true

  scope :not_reviewed, -> { where(state: 'open') }

  belongs_to :user
  belongs_to :language
end
