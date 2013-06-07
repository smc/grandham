class Publisher < ActiveRecord::Base
  attr_accessible :name

  has_many :publications
  has_many :book_submissions, through: :publications
end
