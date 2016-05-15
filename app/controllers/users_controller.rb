class UsersController < ApplicationController
  before_action :current_user, only: [:index, :show]
  helper_method :sort_column, :sort_direction
 
  def show
    @user = User.find(params[:id])
    @courses = @user.courses
    @students = @user.students
  end

  def index
    @users = User.all
  end

  private

end
