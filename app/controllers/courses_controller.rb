class CoursesController < ApplicationController
  before_action :correct_user, only: [:edit, :destroy]
  def new
    @course = Course.new
  end
  def create
    @course = current_user.courses.build(course_params)
    if @course.save
      flash[:success] = "Course Created Successfully!"
      redirect_to current_user
    else
      render 'new'
    end
  end

  def destroy
    @course.destroy
    flash[:success] = "Course deleted"
    redirect_to request.referrer || root_url
  end

  def show
  end

  def edit
    @course = current_user.courses.find_by(id: params[:id])
  end

  def update
    @course = current_user.courses.find_by(id: params[:id])
    if @course.update_attributes(course_params)
      flash[:success] = "Course Updated"
      redirect_to @course.user
    else
      render 'edit'
    end
  end

  def add_enrollment
    @course = Course.find(params[:id])
    @student = Student.find(params[:student_id])
    @course.students << @student
    if @course.save
      flash[:success] = "Enrolled Successfully" 
      redirect_to root_url
    else
      flash[:danger] = "Something went wrong. Try Enrolling Again"
    end
  end

  def remove_enrollment
    @course = Course.find(params[:id])
    @student = Student.find(params[:student_id])
    @course.students.delete(@student)
    if @course.save
      flash[:success] = "Enrollment Deleted Successfully"
      redirect_to root_url
    else
      flash[:danger] = "Oops! We're unable to delete the enrollment right now. Try again."
    end
  end
  private

    def course_params
      params.require(:course).permit(:course_name , :course_sequence_number, :period)
    end

    def correct_user
      @course = current_user.courses.find_by(id: params[:id])
      redirect_to root_url if @course.nil?
    end
end
