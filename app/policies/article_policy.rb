class ArticlePolicy < ApplicationPolicy
  class Scope < Scope
    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      if !user.nil? && user.editor?
        scope.all
      elsif !user.nil? && user.author?
        scope.where(author_id: @user.id) + scope.where(published: true)
      else
        scope.where(published: true)
      end
    end
  end

  def show?
    (!user.nil? && user.editor?) || (!user.nil? && (@user.id == record.author_id)) || record.published?
  end

  def create?
    return false if @user.nil?
    @user.editor? || @user.author?
  end

  def publish?
    return false if @user.nil?
    @user.editor?
  end

  def edit?
    update?
  end

  def update?
    return false if @user.nil?
    @user.editor? || ((@user.id == record.author_id) && record.published == false)
  end

  def destroy?
    return false if @user.nil?
    @user.editor? || ((@user.id == record.author_id) && record.published == false)
  end
end
