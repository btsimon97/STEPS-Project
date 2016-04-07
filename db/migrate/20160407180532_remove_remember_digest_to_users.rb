class RemoveRememberDigestToUsers < ActiveRecord::Migration
  def change
    remove_column :users, :remember_digest
  end
end
