class Role < ApplicationRecord

  has_many  :users
  has_many  :shelter_staffs

  validates :title, presence: true
  validates :title, uniqueness: true

end
