class SocialNetwork < ApplicationRecord

  has_many  :social_pages

  validates :url, :logotype, :title, presence: true

end
