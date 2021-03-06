class RecipePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def edit?
    @record.user_id == @user.id
  end

  def update?
    @record.user_id == @user.id
  end

  def destroy?
    @record.user_id == @user.id
  end
end
