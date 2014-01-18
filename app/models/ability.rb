class Ability
  include CanCan::Ability

  def initialize(user, controller_namespace)
    user ||= User.new

    can :manage, :all

   # case controller_namespace
   #   when 'admin'
   #     can :manage, :all if user.role? :admin
   #     can :manage, :all if user.role? :super_admin
   #   when 'publisher'
   #     can :manage, :all if user.role? :publisher
   #   when 'library'
   #     can :manage, :all if user.role? :librarian
   #   else
   #     can :manage, :all if user.role? :admin
   #     can :manage, :all if user.role? :super_admin
#
#        if user.role? :contributor
#          can :manage, [book, author, publisher, library]
#        else
#          can :read, [book, author, publisher, library]
#          can :history, [book]
#          can :books, [author, publisher, library]
#        end
#    end
  end
end
