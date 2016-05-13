class AddPassPropertiesToPass < ActiveRecord::Migration
  def change
    add_column :passes, :destination, :string
    add_column :passes, :time_out, :time
    add_column :passes, :returning, :boolean
    add_column :passes, :return_time, :time
  end
end
