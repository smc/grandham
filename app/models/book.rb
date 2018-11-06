# frozen_string_literal: true

class Book < ApplicationRecord
  default_scope -> { where(approved: true, published: true) }

  belongs_to :language

  before_create :set_grandham_id

  has_many :authorships, dependent: :destroy
  has_many :authors, through: :authorships
  accepts_nested_attributes_for :authors

  has_many :publications, dependent: :destroy

  has_many :publishers, through: :publications
  accepts_nested_attributes_for :publishers

  has_many :availabilities, dependent: :destroy

  has_many :libraries, through: :availabilities
  accepts_nested_attributes_for :libraries

  has_many :edits, as: :editable, dependent: :destroy

  has_many :new_items, as: :creatable, dependent: :destroy

  has_many :covers, as: :imageable, dependent: :destroy

  accepts_nested_attributes_for :covers

  validates :title, :isbn, presence: true

  validates :pages, numericality: { only_integers: true }, allow_blank: true
  validates :year, numericality: {
    only_integers: true,
    greater_than: 1499,
    less_than: 2200
  }

  after_create :process_associated_records

  scope :not_reviewed, -> { where(reviewed: false) }
  scope :approved, -> { where(approved: true) }

  searchkick word_start: %i[description title_orginal approved], word_middle: [:title]

  def approve!
    self.approved = true
    save
  end

  def name
    title
  end

  def details
    restricted_keys = %i[id created_at updated_at approved
                         reviewed grandham_id language_id published]
    attrs = attributes.with_indifferent_access
    restricted_keys.collect { |key| attrs.delete key }
    attrs
  end

  def to_param
    grandham_id
  end

  def self.associated_records
    %w[Author Publisher Library]
  end

  def publish!
    update_attribute :published, true
  end

  def unpublish!
    update_attribute :published, false
  end

  private

  def set_grandham_id
    self.grandham_id = SecureRandom.hex(8)
  end

  def remove_duplicate_associated_objects(klass)
    send(klass.to_s.downcase.pluralize).each do |object|
      existing_object = klass.where(name: object.name).where.not(id: object.id).first
      if existing_object
        existing_object.books << self
        object.destroy
      end
    end
  end

  def process_associated_records
    associated_objects_array = [Author, Publisher, Library]

    associated_objects_array.each do |klass|
      send(klass.to_s.downcase.pluralize).update_all(language_id: language_id)
    end

    associated_objects_array.each { |klass| remove_duplicate_associated_objects(klass) }

    covers.create if covers.empty?
  end
end
