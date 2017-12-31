class UserPolicy
  def index?
    user.admin?  or
    user.moderator?
  end

  def create?
    true
  end

  def new?
    create?
  end

  def update?
    user.admin? or
    user.moderator? or
    user.user == user
  end

  def edit?
    update?
  end

  def destroy?
    false
  end

  private

  def user
    record
  end

end
