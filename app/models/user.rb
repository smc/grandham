class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :login, :publisher_id, :library_id
  # attr_accessible :title, :body

  validates :login, uniqueness: true, presence: true

  ROLES = %w[super_admin admin contributor publisher librarian]

  after_create :set_default_role

  has_many :edits
  has_many :new_items

  belongs_to :language
  belongs_to :publisher
  belongs_to :library

  def role?(key)
    role == key.to_s
  end

  def set_as_super_admin(language)
    self.role        = 'super_admin'
    self.language_id = language.id

    self.save
  end

  def is_a_admin?
    ['super_admin', 'admin'].include? role
  end

  private

  def set_default_role
    self.update_attribute :role, 'contributor' unless role
  end
end
