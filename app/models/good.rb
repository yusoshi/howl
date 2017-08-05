class Good < ApplicationRecord
  belongs_to :article, counter_cache: :goods_count
  belongs_to :user
end
