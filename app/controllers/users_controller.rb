class UsersController < ApplicationController
  before_action :current_user, only: [:index, :show] 
  def show
    @user = User.find(params[:id])
  end

  def index
    @users = User.paginate(page: params[:page])
  end
end
