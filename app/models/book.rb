class Book < ActiveRecord::Base
  attr_accessible :title, :isbn, :pages, :year, :description, :edition, \
                  :authors_attributes, :publishers_attributes, :libraries_attributes, \
                  :ddc, :volume, :series, :price, :length, :title_orginal, :illustrator, \
                  :note, :grandham_id, :language_id, :preface, :covers_attributes

  belongs_to :language

  before_create :set_grandham_id

  has_many :authorships
  has_many :authors, through: :authorships
  accepts_nested_attributes_for :authors

  has_many :publications
  has_many :publishers, through: :publications
  accepts_nested_attributes_for :publishers

  has_many :availabilities
  has_many :libraries, through: :availabilities
  accepts_nested_attributes_for :libraries

  has_many :edits, as: :editable

  has_many :covers, as: :imageable
  accepts_nested_attributes_for :covers

  validates_presence_of :title

  after_create :process_associated_records

  scope :not_reviewed, -> { where(reviewed: false) }
  scope :approved, -> { where(approved: true) }

  # searchable do
  #   text :title
  #   text :description
  #   text :title_orginal
  # end

  def details
    restricted_keys = [:id, :created_at, :updated_at, :approved, :reviewed]
    attrs = attributes.with_indifferent_access
    restricted_keys.collect{ |key| attrs.delete key }
    attrs
  end

  def to_param
    grandham_id
  end

  def self.associated_records
    ['Author', 'Publisher']
  end

  private

  def set_grandham_id
    self.grandham_id = SecureRandom.hex(8)
  end

  def remove_duplicate_associated_objects(klass)
    self.send(klass.to_s.downcase.pluralize).each do |object|
      if existing_object = klass.where([ "name = ? and id <> ?", object.name, object.id]).first
        existing_object.books << self
        object.destroy
      end
    end
  end

  def process_associated_records
    associated_objects_array = [Author, Publisher, Library]

    associated_objects_array.each do |klass|
      self.send(klass.to_s.downcase.pluralize).update_all(language_id: self.language_id)
    end

    associated_objects_array.each{ |klass| remove_duplicate_associated_objects(klass) }

    self.covers.create if self.covers.empty?
  end
end