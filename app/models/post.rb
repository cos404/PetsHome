class Post < ApplicationRecord

  belongs_to  :user

  has_many    :post_images
  has_many    :comments

  validates :title, :body, :user_id, presence: true
  validates :user_id, numericality: true

end
