class CreateArticlesTags < ActiveRecord::Migration[5.0]
  def change
    create_table :articles_tags do |t|
      t.references    :article, null: false
      t.references    :tag, null: false
      t.timestamps
    end
  end
end
