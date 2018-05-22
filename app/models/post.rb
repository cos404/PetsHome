class Post < ApplicationRecord
  include PublicActivity::Model
  tracked owner: Proc.new{ |controller, model| model.user}

  belongs_to  :user

  has_many    :post_images

  validates :title, :body, :user_id, presence: true
  validates :user_id, numericality: true

end
