class Language < ActiveRecord::Base
  attr_accessible :name, :short_code

  has_many :books
  has_many :authors
  has_many :publishers

  def to_param
    short_code
  end
end