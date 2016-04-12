require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  include Devise::TestHelpers  
  def setup
    @base_title = "The STEPS Project"
  end

  test "should get home" do
    get :home
    assert_response :success
    assert_select "title","#{@base_title}" 
  end

  test "should get help" do
    get :help
    assert_response :success
    assert_select "title","Help | #{@base_title}"
  end

  test "shoud get about" do
    get :about
    assert_response :success
    assert_select "title","About | #{@base_title}"
  end

  test "should get contact" do
    get :contact
    assert_response :success
    assert_select "title", "Contact | The STEPS Project"
  end
end
