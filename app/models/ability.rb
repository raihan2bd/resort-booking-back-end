class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, Resort

    return unless user.present?

    can :read, Resort
    can :read, Booking, user_id: user.id
    can :create, Booking
    can :destroy, Booking, user_id: user.id

    return unless user.role == 'admin'

    can :manage, :all
  end
end
