class Article < ApplicationRecord

  #アソシエーション
  belongs_to :user

  has_many :article_tags
  has_many :tags, through: :article_tags

  #バリデーション
  validates :title, presence: true
  validates :body, presence: true
end
