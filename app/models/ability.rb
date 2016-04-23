class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.admin?
      can :manage, :all
    elsif user.salesman?
      can :read, Customer
      can [:create, :update], Customer, salesman_id: user.id
      can :read, User
      can :update, User, id: user.id
      can :manage, Lot
    end
  end
end
