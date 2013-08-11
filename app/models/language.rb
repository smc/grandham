class Language < ActiveRecord::Base
  attr_accessible :name, :short_code

  has_many :books
  has_many :authors
  has_many :publishers

  has_many :books, through: :books

  def to_param
    short_code
  end

  def self.default
    where(default: true).first
  end
end