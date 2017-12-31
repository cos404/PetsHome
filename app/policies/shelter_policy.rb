class ShelterPolicy
 attr_reader :user, :shelter

  def initialize(user, shelter)
    @user = user
    @shelter = shelter
  end

  def index?
    true
  end

  def show?
    true
  end

  def create?
    user.present?
  end

  def new?
    create?
  end

  def update?
    user.admin? or
    user.moderator? or
    shelter.user == user
  end

  def edit?
    update?
  end

  def destroy?
    user.admin? or
    user.moderator?
  end

end
