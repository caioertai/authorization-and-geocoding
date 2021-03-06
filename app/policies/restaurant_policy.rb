class RestaurantPolicy < ApplicationPolicy
  # Coming from the ApplicationPolicy
  # attr_reader :user, :record

  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    true
  end

  def show?
    true
  end

  def update?
    user_is_owner_or_admin?
  end

  def destroy?
    user_is_owner_or_admin?
  end

  private

  def user_is_owner_or_admin?
    return false unless user

    # record => a restaurant instance
    # user   => the current user
    record.user == user || user.admin?
  end
end
