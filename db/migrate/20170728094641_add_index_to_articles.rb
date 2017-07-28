class AddIndexToArticles < ActiveRecord::Migration[5.0]
  def change
    add_index :articles, [:title, :user_id]
  end
end
