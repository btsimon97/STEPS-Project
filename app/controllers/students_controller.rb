class StudentsController < ApplicationController
  before_action :current_student, only: [:index, :show]
  helper_method :sort_column, :sort_direction

  def show
    @student = Student.find(params[:id])
    @courses = @student.courses
  end

  def index
    @student = Student.all
  end

  private

end

