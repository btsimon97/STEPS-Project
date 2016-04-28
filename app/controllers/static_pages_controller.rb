class StaticPagesController < ApplicationController
  def home
    if user_signed_in?
      @courses = current_user.courses.paginate(page: params[:page], per_page:5)
    end
  end

  def help
  end
  
  def about
  end

  def contact
  end

  def news 
  end
end
