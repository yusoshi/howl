class Tag < ApplicationRecord
  #バリデーション
  validates :name, presence: true, uniqueness: true
end
