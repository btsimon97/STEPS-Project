class StaticPagesController < ApplicationController
  helper_method :sort_column, :sort_direction

  def home
    if user_signed_in?
      @courses = current_user.courses.order(sort_column + " " + sort_direction).paginate(page: params[:page], per_page:5)
    elsif student_signed_in?
      @courses = current_student.courses.order(sort_column + " " + sort_direction).paginate(page: params[:page], per_page:5)
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

  def login
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
