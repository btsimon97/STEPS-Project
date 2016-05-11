class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) << :first_name
      devise_parameter_sanitizer.for(:sign_up) << :last_name
      devise_parameter_sanitizer.for(:sign_up) << :user_number 
      devise_parameter_sanitizer.for(:sign_up) << :student_number
      devise_parameter_sanitizer.for(:sign_up) << :avatar
      devise_parameter_sanitizer.for(:sign_up) << :subject_area
      devise_parameter_sanitizer.for(:account_update) << :first_name
      devise_parameter_sanitizer.for(:account_update) << :last_name
      devise_parameter_sanitizer.for(:account_update) << :user_number
      devise_parameter_sanitizer.for(:account_update) << :student_number
      devise_parameter_sanitizer.for(:account_update) << :avatar
      devise_parameter_sanitizer.for(:account_update) << :subject_area
      devise_parameter_sanitizer.for(:account_update) << :instructional_level
      devise_parameter_sanitizer.for(:account_update) << :school_name
      devise_parameter_sanitizer.for(:account_update) << :location
    end
  end
