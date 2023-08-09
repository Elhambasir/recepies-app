# frozen_string_literal: true

class Ability
  include CanCan::Ability
  
  def initialize(user)    
    can :read, Food
    return unless user.present?
    can :manage, Food, user_id: user.id
  end
end
