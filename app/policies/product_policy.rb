# frozen_string_literal: true

class ProductPolicy
  attr_reader :user

  def initialize(user, _record)
    @user = user
  end

  def create?
    user.admin?
  end

  def update?
    user.admin?
  end

  def destroy?
    user.admin?
  end
end
