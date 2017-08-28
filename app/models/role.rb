class Role < ApplicationRecord

  has_many :users

  validates :title, presence: true
  validates :title, uniqueness: true

end
