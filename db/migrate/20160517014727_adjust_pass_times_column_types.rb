class AdjustPassTimesColumnTypes < ActiveRecord::Migration
  def up
    change_column :passes, :time_out, :datetime
    change_column :passes, :return_time, :datetime
  end

  def down
    change_column :passes, :time_out, :time
    change_column :passes, :return_time, :time
  end
end
