class AddPeriodToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :period, :integer
    add_index :courses, :period
  end
end
