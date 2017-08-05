class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable,
         authentication_keys: [:name]

  # アソシエーション
  has_many :articles
  has_many :goods
  has_many :comments

  # ユーザーセッションのバリデーション
  validates :name, presence: true, uniqueness: true
  validates :password, presence: true
  validates :biography, length: { maximum: 400}

  #nameを利用してログインするようにオーバーライド
  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      #認証の条件式を変更する
      where(conditions).where(["name = :value", { value: name }]).first
    else
      where(conditions).first
    end
  end

  def email_required?
    false
  end

  def email_changed?
    false
  end

  # SNS認証
  def self.find_for_oauth(auth)
    user = User.where(uid: auth.uid, provider: auth.provider).first

    unless user
      user = User.create(
        name:       auth.info.name,
        uid:        auth.uid,
        provider:   auth.provider,
        password:   Devise.friendly_token[0, 20]
      )
    end
    user
  end

  private

end
