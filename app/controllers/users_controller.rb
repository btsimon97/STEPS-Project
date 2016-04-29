class UsersController < ApplicationController
  before_action :current_user, only: [:index, :show]
  helper_method :sort_column, :sort_direction
 
  def show
    @user = User.find(params[:id])
    @courses = @user.courses.order(sort_column + " " + sort_direction).paginate(page: params[:page])
  end

  def index
    @users = User.paginate(page: params[:page])
  end

  private

  def sort_column
    Course.column_names.include?(params[:sort]) ? params[:sort] : 'course_name'
    Course.column_names.include?(params[:sort]) ? params[:sort] : 'course_sequence_number'
    Course.column_names.include?(params[:sort]) ? params[:sort] : 'period'
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
  end
end
