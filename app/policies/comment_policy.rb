class CommentPolicy < ApplicationPolicy
 attr_reader :user, :comment

  def initialize(user, comment)
    @user = user
    @comment = comment
  end

  def create?
    user.present?
  end

  def destroy?
    user.present? and
    (user.admin? or
    user.moderator?)
  end
end
