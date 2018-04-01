class Comment < ApplicationRecord

  belongs_to  :user
  belongs_to  :commentable, polymorphic: true

  validates :user_id, :body,  presence: true
  validates :user_id, numericality: true

end
