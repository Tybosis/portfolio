class ArticlePolicy < ApplicationPolicy
  class Scope < Scope
    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      if user.editor?
        scope.all
      elsif user.author?
        scope.where(user.author == article.params[:author])
      else
        scope.where(published: true)
      end
    end
  end

  def create?
    @user.editor? || @user.author?
  end

  def publish?
    @user.editor?
  end

  def update?
    @user.editor?
  end
end
