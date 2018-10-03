# frozen_string_literal: true

class Picture < ApplicationRecord
  has_attached_file :image, styles: { large: '600x600>', medium: '300x300>', thumb: '100x100>', small_thumb: '64x64>' }, default_url: '/book_cover_missing.png'

  belongs_to :imageable, polymorphic: true
end
