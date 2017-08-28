class PostImage < ApplicationRecord

  belongs_to  :post
  belongs_to  :user

  validates :user_id, :post_id, :title, presence: true
  validates :user_id, :post_id, numericality: true

end
