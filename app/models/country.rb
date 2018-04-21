class Country < ApplicationRecord

  has_many  :cities
  has_many  :regions
  has_many  :shelters

  validates :title, presence: true
  validates :title, uniqueness: true

  enum lookup_code: [:google, :yandex, :baidu]

end
