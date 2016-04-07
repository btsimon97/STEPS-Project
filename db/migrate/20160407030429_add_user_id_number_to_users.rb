class AddUserIdNumberToUsers < ActiveRecord::Migration
  def change
    add_column :users, :user_id_number, :integer
    add_index :users, :user_id_number
  end
end
