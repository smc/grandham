class Submission < ActiveRecord::Base
  attr_accessible :book_id, :title, :isbn, :pages, :year, :description, :edition, :authors_attributes, :approved_submission

  belongs_to :book

  has_many :authorships
  has_many :authors, through: :authorships
  accepts_nested_attributes_for :authors

  has_many :publications
  has_many :publishers, through: :publications

  has_many :data

  validates_presence_of :title

end
