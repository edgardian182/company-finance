class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:

    user ||= User.new

    alias_action :create, :read, :update, :destroy, :to => :crud

    if user.superadmin_role?
        can :manage, :all
    end
    if user.supervistor_role?
        can :manage, :all
    end
    if user.user_role?
        # can :read, Client, :user => current_user
        # can :create, Client
        # can :update, Client, :user => current_user
        can :crud, Client, :user_id => user.id
        can :crud, Order, :user_id => user.id
        # can :crud, Order, :client_id => 
    end


    # 
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user 
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on. 
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end
end
