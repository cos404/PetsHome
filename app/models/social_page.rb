class SocialPage < ApplicationRecord

  belongs_to  :user

  validates :url, :network_id, :user_id, presence: true
  validates :network_id, :user_id, numericality: true

end
