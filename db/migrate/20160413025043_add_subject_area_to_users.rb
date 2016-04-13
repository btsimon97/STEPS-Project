class AddSubjectAreaToUsers < ActiveRecord::Migration
  def change
    add_column :users, :subject_area, :string
  end
end
