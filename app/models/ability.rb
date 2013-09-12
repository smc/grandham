class Ability
  include CanCan::Ability

  def initialize(user, controller_namespace)
    user ||= User.new

    case controller_namespace
      when 'Admin'
        can :manage, :all if user.role? :admin
        can :manage, :all if user.role? :super_admin
      else
        can :manage, :all if user.role? :admin
        can :manage, :all if user.role? :super_admin

        if user.role? :contributor
          can :manage, [Book, Author, Publisher]
        else
          can :read, [Book, Author, Publisher]
        end
    end
  end
end