class Comment < ApplicationRecord

  belongs_to  :user
  belongs_to  :post

  validates :user_id, :post_id, :body,  presence: true
  validates :user_id, :post_id, numericality: true

end
