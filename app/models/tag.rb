class Tag < ApplicationRecord
  #アソシエーション
  has_many  :article_tags
  has_many  :articles, through: :article_tags

  #バリデーション
  validates :name, presence: true, uniqueness: true
end
