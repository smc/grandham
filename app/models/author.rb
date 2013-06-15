class Author < ActiveRecord::Base
  attr_accessible :name

  has_many :authorships
  has_many :submissions, through: :authorships

end
