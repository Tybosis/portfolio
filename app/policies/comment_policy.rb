class CommentPolicy < ApplicationPolicy
  def update?
    return false if @user.nil?
    @user.editor? && !record.approved?
  end

  def destroy?
    return false if @user.nil?
    @user.editor? && !record.approved?
  end

  def view?
    record.approved? || (!@user.nil? && @user.editor?)
  end
end
