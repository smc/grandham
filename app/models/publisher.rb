class Publisher < ActiveRecord::Base
  attr_accessible :name

  has_many :publications
  has_many :submissions, through: :publications
end
