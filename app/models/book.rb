class Book < ActiveRecord::Base
  attr_accessible :title, :isbn, :pages, :year, :description, :edition, \
                  :authors_attributes, :approved_submission, :publishers_attributes, \
                  :ddc, :volume, :series, :price, :length, :title_orginal, :illustrator, \
                  :note, :grandham_id, :language_id

  belongs_to :language

  before_create :set_grandham_id

  def to_param
    grandham_id
  end

  private

  def set_grandham_id
    self.grandham_id = SecureRandom.hex(8)
  end

  has_many :authorships
  has_many :authors, through: :authorships
  accepts_nested_attributes_for :authors

  has_many :publications
  has_many :publishers, through: :publications
  accepts_nested_attributes_for :publishers

  validates_presence_of :title

  after_create :process_associated_records

  scope :not_reviewed, -> { where(reviewed: false) }
  scope :approved, -> { where(approved: true) }

  searchable do
    text :title
    text :description
    text :title_orginal
    boolean :approved
  end

  def self.initialize_with_data(book)
    submission = new book.approved_submission.details
    submission.authors.build      name: book.approved_submission.authors.first.name
    submission.publishers.build   name: book.approved_submission.publishers.first.name

    submission
  end

  def details
    restricted_keys = [:id, :created_at, :updated_at, :approved, :reviewed]
    attrs = attributes.with_indifferent_access
    restricted_keys.collect{ |key| attrs.delete key }
    attrs
  end

  def set_reviewed!
    update_attribute :reviewed, true
  end

  def set_approved!
    self.book.submissions.update_all approved: false

    update_attribute :approved, true
    self.set_reviewed!
  end

  private

  def remove_duplicate_associated_objects(klass)
    self.send(klass.to_s.downcase.pluralize).each do |object|
      if existing_object = klass.where([ "name = ? and id <> ?", object.name, object.id]).first
        existing_object.submissions << self
        object.destroy
      end
    end
  end

  def process_associated_records
    [Author, Publisher].each{ |klass| remove_duplicate_associated_objects(klass) }
  end
end