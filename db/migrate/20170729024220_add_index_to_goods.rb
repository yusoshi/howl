class AddIndexToGoods < ActiveRecord::Migration[5.0]
  def change
    add_index :goods, [:user_id, :article_id]
  end
end
