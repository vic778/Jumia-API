class CategoryPolicy < ApplicationPolicy

  def index?
    user.has_permission?(:index, :company)
  end

  def show?
    user.has_permission?(:show, :company)
  end

  def create?
    user.has_permission?(:create, :category)
  end

  def new?
    create?
  end

  def update?
    user.has_permission?(:update, :category)
  end

  def edit?
    update?
  end

  def destroy?
    user.has_permission?(:destroy, :category)
  end

  class Scope < Scope
   
  end
end
