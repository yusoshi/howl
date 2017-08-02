class Article < ApplicationRecord

  #アソシエーション
  belongs_to :user

  has_many :articles_tags
  has_many :tags, through: :articles_tags
  has_many :goods
  has_many :comments

  #バリデーション
  validates :title, presence: true
  validates :body, presence: true

  # 最終更新日のフォーマットを整える
  def updated_at_format
    raw_updated_at = self.updated_at
    return raw_updated_at
  end
end
