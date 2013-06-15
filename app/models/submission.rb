class Submission < ActiveRecord::Base
  attr_accessible :approved, :book_id

  belongs_to :book
  has_many :marc_data

  has_many :authorships
  has_many :authors, through: :authorships

  has_many :publications
  has_many :publishers, through: :publications
end
