class CreateCourseTeachers < ActiveRecord::Migration
  def change
    create_table :course_teachers do |t|
      t.belongs_to :user, index: true
      t.belongs_to :course, index: true
    end
  end
end
