class Comment < ApplicationRecord
  include PublicActivity::Model
  tracked only: [:create, :update], owner: Proc.new{|controller, model| controller.current_user}

  belongs_to  :user
  belongs_to  :commentable, polymorphic: true

  validates :user_id, :body,  presence: true
  validates :user_id, numericality: true

end
