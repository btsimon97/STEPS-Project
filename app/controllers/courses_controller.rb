class CoursesController < ApplicationController

  def create
    @course = current_user.courses.build(course_params)
    if @course.save
      flash[:success] = "Course Created Successfully!"
      redirect_to current_user
    end
  end
end
