class Article < ApplicationRecord

  #アソシエーション
  belongs_to :user

  has_many :articles_tags
  has_many :tags, through: :articles_tags

  #バリデーション
  validates :title, presence: true
  validates :body, presence: true
end
