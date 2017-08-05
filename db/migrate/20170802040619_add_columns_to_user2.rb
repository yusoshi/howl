class AddColumnsToUser2 < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :organization, :string
    add_column :users, :biography, :text, limit: 200
  end
end
