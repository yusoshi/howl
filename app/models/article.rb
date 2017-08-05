class Article < ApplicationRecord

  #アソシエーション
  belongs_to :user

  has_many :articles_tags
  has_many :tags, through: :articles_tags
  has_many :goods, dependent: :destroy
  has_many :comments

  #バリデーション
  validates :title, presence: true
  validates :body, presence: true

  # 最終更新日のフォーマットを整える
  def updated_at_format
    raw_updated_at = self.updated_at.to_s
    reg_exp_update_at = raw_updated_at.match(/(.\d)-(.\d)-(.\d)/)
    updated_at = '20' + reg_exp_update_at[1] + '年' + reg_exp_update_at[2] + '月' + reg_exp_update_at[3] + '日'
    return updated_at
  end

  # 該当記事にユーザーがいいねしているかどうか
  def good_user(user)
    goods.find_by(user_id: user)
  end
end
