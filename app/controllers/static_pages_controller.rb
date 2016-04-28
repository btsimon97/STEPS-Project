class StaticPagesController < ApplicationController
  def home
    @courses = current_user.courses.paginate(page: params[:page], per_page:5)
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
