class Submission < ActiveRecord::Base
  attr_accessible :book_id, :title, :isbn, :pages, :year, :description, :edition, :authors_attributes, :approved_submission, :publishers_attributes

  belongs_to :book

  has_many :authorships
  has_many :authors, through: :authorships
  accepts_nested_attributes_for :authors

  has_many :publications
  has_many :publishers, through: :publications
  accepts_nested_attributes_for :publishers

  has_many :data

  validates_presence_of :title


  def self.initialize_with_data(book)
    submission = new book.approved_submission.details
    submission.authors.build      name: book.approved_submission.authors.first.name
    submission.publishers.build   name: book.approved_submission.publishers.first.name

    submission
  end

  def details
    restricted_keys = [:id, :created_at, :updated_at, :approved]
    attrs = attributes.with_indifferent_access
    restricted_keys.collect{ |key| attrs.delete key }
    attrs
  end

end
