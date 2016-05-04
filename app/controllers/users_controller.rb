class UsersController < ApplicationController
  before_action :current_user, only: [:index, :show]
  helper_method :sort_column, :sort_direction
 
  def show
    @user = User.find(params[:id])
    @courses = @user.courses.order(sort_column + " " + sort_direction).paginate(page: params[:page])
  end

  def index
    @users = User.order(sort_column + " " + sort_direction).paginate(page: params[:page])
  end

  private

  def sort_column
   # Course.
    if action_name.to_s == 'show'
      Course.column_names.include?(params[:sort]) ? params[:sort] : 'course_name'
    elsif action_name.to_s == 'index'
      User.column_names.include?(params[:sort]) ? params[:sort] : 'school_name'
    else
      Course.column_names.include?(params[:sort]) ? params[:sort] : 'course_name'
      User.column_names.include?(params[:sort]) ? params[:sort] : 'school_name'
    end
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
  end
end
