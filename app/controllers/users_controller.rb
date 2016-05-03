class UsersController < ApplicationController
  before_action :current_user, only: [:index, :show]
  helper_method :sort_column, :sort_direction
 
  def show
    @user = User.find(params[:id])
    @courses = @user.courses.order(sort_column + " " + sort_direction).paginate(page: params[:page])
  end

  def index
    @user = User.all
    @users = User.order(sort_column + " " + sort_direction).paginate(page: params[:page])
  end

  private

  def sort_column
    Course.column_names.include?(params[:sort]) ? params[:sort] : 'course_name'
    Course.column_names.include?(params[:sort]) ? params[:sort] : 'course_sequence_number'
    Course.column_names.include?(params[:sort]) ? params[:sort] : 'period'
    User.column_names.include?(params[:sort]) ? params[:sort] : 'first_name'
    User.column_names.include?(params[:sort]) ? params[:sort] : 'last_name'
    User.column_names.include?(params[:sort]) ? params[:sort] : 'subject_area'
    User.column_names.include?(params[:sort]) ? params[:sort] : 'instructional_level'
    User.column_names.include?(params[:sort]) ? params[:sort] : 'school_name'
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
  end
end
