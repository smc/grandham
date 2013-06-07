class Author < ActiveRecord::Base
  attr_accessible :name

  has_many :authorships
  has_many :book_submissions, through: :authorships

end
