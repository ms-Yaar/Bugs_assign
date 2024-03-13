# frozen_string_literal: true

#class Ability
 # include CanCan::Ability

 # def initialize(user)
    #def initialize(user)
      #user ||= User.new 
  
     # if user.manager?
        #can :read, Project
        #can [:create, :update, :destroy], Project, user_id: user.id
        #can :manage, Bug
        #can :manage, Project
        # can :manage,:all



     # elsif user.qa?
        #can :read, Bug ,user_id: user.id
        #can :read, Project, user_id: user.id
       # can :manage , Bug,user_id: user.id

    #  elsif user.developer?
        #can :read, Project, user_id: user.id

       # can [:read, :edit,:update], Bug, user_id: user.id

       
       # can :edit, Bug, user_id: user.id[]











      
    # Define abilities for the user here. For example:
    #
    #   return unless user.present?
    #   can :read, :all
    #   return unless user.admin?
    #   can :manage, :all
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
    #   can :update, Article, published: true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/blob/develop/docs/define_check_abilities.md
  #end
#end
#end
#end




class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.manager?
      can :manage, Project, creator_id: user.id
      can :manage, Bug, creator_id: user.id
      #can :manage, creator_id: user.id
      
    elsif user.qa?
      #can :read, Bug, user_id: user.id
      can :read, Project, user_id: user.id
      can :manage, Bug
    elsif user.developer?
      can :read, Project, user_id: user.id
      can [:read,:edit, :update], Bug, user_id: user.id
     
     

    end
  end
end