class AddIndexToComments < ActiveRecord::Migration[5.0]
  def change
    add_index :comments, [:user_id, :article_id]
  end
end
