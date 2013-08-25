class Picture < ActiveRecord::Base
  attr_accessible :image

  has_attached_file :image, :styles => { large: "600x600>" , medium: "300x300>", thumb: "100x100>" }
end
