class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.role? :super_admin
      can :manage, :all

    elsif user.role? :admin
      can [ :index, :show, :approve, :discard, :replace ], 'admin/reviews'
      can :manage, [Book, Author, Publisher]

    elsif user.role? :contributor
      can :manage, [Book, Author, Publisher]

    else
      can :read, [Book, Author, Publisher]
    end
  end
end
