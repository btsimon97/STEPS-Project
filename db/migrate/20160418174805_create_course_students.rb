class CreateCourseStudents < ActiveRecord::Migration
  def change
    create_table :course_students do |t|
      t.belongs_to :user, index: true
      t.belongs_to :course, index: true
    end
  end
end
