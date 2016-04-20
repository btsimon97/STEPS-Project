class AddInstructionalLevelToUsers < ActiveRecord::Migration
  def change
    add_column :users, :instructional_level, :string
  end
end
