class RemoveIndexEailFromUsers < ActiveRecord::Migration[5.0]
  def change
    remove_index :users, column: :email, unique: true
  end
end
