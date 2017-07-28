class Tag < ApplicationRecord
  #アソシエーション
  has_many  :articles_tags
  has_many  :articles, through: :articles_tags

  #バリデーション
  validates :name, presence: true, uniqueness: true
end
