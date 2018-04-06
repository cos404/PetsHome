class ShelterStaffPolicy < ApplicationPolicy
  attr_reader :user, :staff

  def initialize(user, staff)
    @user = user
    @staff = staff
  end

  def index?
    true
  end

  def show?
    true
  end

  def create?
    user.present? and
    (user.id == staff.shelter.user_id or
    user.shelter_staffs.where(role: :curator).exists?(staff.shelter_id) or
    user.admin? or
    user.moderator?)
  end

  def new?
    create?
  end

  def update?
    user.present? and
    (user.id == staff.shelter.user_id or
    user.shelter_staffs.where(role: :curator).exists?(staff.shelter_id) or
    user.admin? or
    user.moderator?)
  end

  def edit?
    update?
  end

  def destroy?
    user.present? and
    (user.id == staff.shelter.user_id or
    user.shelter_staffs.where(role: :curator).exists?(staff.shelter_id) or
    user.admin? or
    user.moderator?)
  end
end