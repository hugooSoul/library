class Ability
  include CanCan::Ability

  def initialize(user)

    if user.admin?
      can :manage, :all
    elsif
      can :manage, User
      can :update, Book
    end

  end
end
