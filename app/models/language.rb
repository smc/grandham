class Language < ActiveRecord::Base
  attr_accessible :name, :short_code

  has_many :books
end
