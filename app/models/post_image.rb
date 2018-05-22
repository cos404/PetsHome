class PostImage < ApplicationRecord

  belongs_to  :post
  belongs_to  :user

  validates :user_id, :post_id, numericality: true

  mount_uploader :title, PostImageUploader

end
