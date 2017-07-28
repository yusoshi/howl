class AddIndexToArticleTags < ActiveRecord::Migration[5.0]
  def change
    add_index :articles_tags, [:article_id, :tag_id]
  end
end
