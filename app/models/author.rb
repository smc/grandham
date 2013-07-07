class Author < ActiveRecord::Base
  attr_accessible :name, :language_id

  belongs_to :language

  has_many :authorships
  has_many :submissions, through: :authorships

end
