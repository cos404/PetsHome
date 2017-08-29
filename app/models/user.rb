class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  belongs_to  :role

  has_many    :comments
  has_many    :pets
  has_many    :posts
  has_many    :post_images
  has_many    :shelters
  has_many    :shelter_photos
  has_many    :shelter_staffs
  has_many    :social_pages

  mount_uploader :avatar, AvatarUploader

end
