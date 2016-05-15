class StudentsController < ApplicationController
  before_action :current_student, only: [:index, :show]

  def show
    @student = Student.find(params[:id])
    @courses = @student.courses
  end

  def index
    @student = Student.all
  end

  private

end

