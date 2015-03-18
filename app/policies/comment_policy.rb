class CommentPolicy < ApplicationPolicy
  def update?
    return false if @user.nil?
    @user.editor? && !record.approved?
  end
end
