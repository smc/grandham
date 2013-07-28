class Language < ActiveRecord::Base
  attr_accessible :name, :short_code

  has_many :books
  has_many :authors
  has_many :publishers

  has_many :submissions, through: :books

  def to_param
    short_code
  end
end