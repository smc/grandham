class Ability
  include CanCan::Ability

  def initialize(user, controller_namespace)
    user ||= User.new

    case controller_namespace
      when 'admin'
        can :manage, :all if user.role? :admin
        can :manage, :all if user.role? :super_admin
      when 'publisher'
        can :manage, :all if user.role? :publisher
      when 'library'
        can :manage, :all if user.role? :librarian
      else
        can :manage, :all if user.role? :admin
        can :manage, :all if user.role? :super_admin

        if user.role? :contributor
          can :manage, [Book, Author, Publisher, Library]
        else
          can :read, [Book, Author, Publisher, Library]
          can :history, [Book]
          can :books, [Author, Publisher, Library]
        end
    end
  end
end
