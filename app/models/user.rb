class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  has_many    :pets
  has_many    :posts
  has_many    :post_images
  has_many    :shelters
  has_many    :shelter_comments
  has_many    :shelter_photos
  has_many    :shelter_staffs
  has_many    :social_pages

  validates :email, uniqueness:{case_sensitive: false, message: :already_taken}

  validates :username, presence: true
  validates :username, uniqueness:{case_sensitive: false, message: :already_taken}
  validates :username, format: { with: /\A[a-zA-Z0-9_]+\Z/, message: :must_contain}

  mount_uploader :avatar, AvatarUploader

  enum role: [:user, :disagner, :developer, :moderator, :admin]
  enum status: [:active, :ban, :deactivated]
end
