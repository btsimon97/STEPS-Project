class UsersController < ApplicationController
  before_action :current_user, only: [:index, :show] 
  def show
    @user = User.find(params[:id])
    @courses = @user.courses.paginate(page: params[:page])
  end

  def index
    @users = User.paginate(page: params[:page])
  end
end
