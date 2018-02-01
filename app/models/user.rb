class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  has_many    :comments
  has_many    :pets
  has_many    :pet_comments
  has_many    :posts
  has_many    :post_images
  has_many    :shelters
  has_many    :shelter_comments
  has_many    :shelter_photos
  has_many    :shelter_staffs
  has_many    :social_pages

  validates :username, presence: true

  mount_uploader :avatar, AvatarUploader

  enum role: [:user, :disagner, :developer, :moderator, :admin]
end
