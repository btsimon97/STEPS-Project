require 'test_helper'

class UsersEditTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:howard)
  end

  test "unsuccessful edit" do
    log_in_as(@user)
    get edit_user_path(@user)
    assert_template 'users/edit'
    patch user_path(@user), user: { first_name:  "",
                                    last_name: "",
                                    user_id_number: "",
                                    email: "foo@invalid",
                                    password:              "foo",
                                    password_confirmation: "bar" }
    assert_template 'users/edit'
  end

  test "successful edit" do
    log_in_as(@user)
    get edit_user_path(@user)
    assert_template 'users/edit'
    first_name = "Foo"
    last_name = "Bar"
    email = "foo@bar.com"
    user_id_number = 123456
    patch user_path(@user), user: { first_name: first_name,
                                    last_name: last_name,
                                    user_id_number: user_id_number,
                                    email: email,
                                    password:              "",
                                    password_confirmation: "" }
    assert_not flash.empty?
    assert_redirected_to @user
    @user.reload
    assert_equal first_name, @user.first_name
    assert_equal last_name, @user.last_name
    assert_equal email, @user.email
    assert_equal user_id_number, @user.user_id_number
  end
  test "successful edit with friendly forwarding" do
    get edit_user_path(@user)
    log_in_as(@user)
    assert_redirected_to edit_user_path(@user)
    first_name =     "Foo"
    last_name =      "Bar"
    user_id_number = 010101
    email =          "foo@bar.com"
    patch user_path(@user), user: { first_name:            first_name,
                                    last_name:             last_name,
                                    user_id_number:        user_id_number,
                                    email:                 email,
                                    password:              "",
                                    password_confirmation: "" }
    assert_not flash.empty?
    assert_redirected_to @user
    @user.reload
    assert_equal first_name,     @user.first_name
    assert_equal last_name,      @user.last_name
    assert_equal user_id_number, @user.user_id_number
    assert_equal email,          @user.email
  end
end
