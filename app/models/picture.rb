class Picture < ActiveRecord::Base
  attr_accessible :image, :book_id

  has_attached_file :image, styles: { large: "600x600>", medium: "300x300>", thumb: "100x100>" }, :default_url => "/book_cover_missing.png"

  belongs_to :imageable, polymorphic: true
end