class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :course_name
      t.integer :course_sequence_number
      t.references :user, index: true, foreign_key: true
      t.references :student, index: true, foreign_key: true
      t.timestamps null: false
    end
    add_index :courses, [:user_id, :course_name]
  end
end
