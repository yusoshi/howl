class ChangeEmailInUsers < ActiveRecord::Migration[5.0]
  def change
    change_column :users, :email, :string, uniqueness: false
  end
end