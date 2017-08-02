class ChangeColumnsInUser < ActiveRecord::Migration[5.0]
  def change
    change_column :users, :biography, :text, limit: 400
  end
end
