class PetPolicy
  attr_reader :user, :pet

  def initialize(user, pet)
    @user = user
    @pet = pet
  end

  def index?
    true
  end

  def show?
    true
  end

  def create?
    user.present? and
    (user.id == pet.shelter.user_id or
    user.shelter_staffs.where(role: :employee).exists? pet.shelter.id or
    user.admin? or
    user.moderator?)
  end

  def new?
    create?
  end

  def update?
    user.present? and
    (user.id == pet.shelter.user_id or
    user.shelter_staffs.where(role: :employee).exists? pet.shelter.id or
    user.admin? or
    user.moderator?)
  end

  def edit?
    update?
  end

  def destroy?
    user.present? and
    (user.id == pet.shelter.user_id or
    user.shelter_staffs.where(role: :employee).exists? pet.shelter.id or
    user.admin? or
    user.moderator?)
  end
end
