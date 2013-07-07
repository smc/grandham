class Publisher < ActiveRecord::Base
  attr_accessible :name, :language_id

  belongs_to :language

  has_many :publications
  has_many :submissions, through: :publications
end
