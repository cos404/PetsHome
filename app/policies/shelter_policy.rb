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
    user.present? and
    (user == shelter.user or
    user.shelter_staffs.where(role: :employee).exists? shelter.id or
    user.admin? or
    user.moderator?)
  end

  def new?
    create?
  end

  def update?
    user.present? and
    (user == shelter.user or
    user.shelter_staffs.where(role: :employee).exists? shelter.id or
    user.admin? or
    user.moderator?)
  end

  def edit?
    update?
  end

  def destroy?
    user.present? and
    (user == shelter.user or
    user.shelter_staffs.where(role: :employee).exists? shelter.id or
    user.admin? or
    user.moderator?)
  end
end
