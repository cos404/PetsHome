class ShelterPolicy < ApplicationPolicy
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
    user.present? and
    (user == shelter.user or
    user.shelter_staffs.where(role: :curator).exists? shelter.id or
    user.admin? or
    user.moderator?)
  end

  def edit?
    update?
  end

  def set_photo?
    update?
  end

  def destroy?
    user.present? and
    (user == shelter.user or
    user.shelter_staffs.where(role: :curator).exists? shelter.id or
    user.admin? or
    user.moderator?)
  end
end
