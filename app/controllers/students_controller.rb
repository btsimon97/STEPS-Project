class StudentsController < ApplicationController
  before_action :current_student, only: [:index, :show]
  helper_method :sort_column, :sort_direction

  def show
    @student = Student.find(params[:id])
    @courses = @student.courses.order(sort_column + " " + sort_direction).paginate(page: params[:page])
  end

  def index
    @student = Student.all
    @students = Student.order(sort_column + " " + sort_direction).paginate(page: params[:page])
  end

  private

  def sort_column
    Course.column_names.include?(params[:sort]) ? params[:sort] : 'course_name'
    Course.column_names.include?(params[:sort]) ? params[:sort] : 'course_sequence_number'
    Course.column_names.include?(params[:sort]) ? params[:sort] : 'period'
    Student.column_names.include?(params[:sort]) ? params[:sort] : 'first_name'
    Student.column_names.include?(params[:sort]) ? params[:sort] : 'last_name'
    Student.column_names.include?(params[:sort]) ? params[:sort] : 'school_name'
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
  end
end

