class Admin::UserPolicy
  attr_reader :user, :user_page

  def initialize(user, user_page)
    @user = user
    @user_page = user_page
  end

  def index?
    true
  end

  def show?
    true
  end

  def create?
    true
  end

  def new?
    create?
  end

  def update?
    user.present? and
    (user.admin? or
    user.moderator? or
    user == user_page)
  end

  def edit?
    update?
  end

  def destroy?
    false
  end

end
