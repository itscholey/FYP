require 'test_helper'

class UsersNewUserTest < ActionDispatch::IntegrationTest

  test "invalid user information" do
    get new_user_path
    assert_no_difference 'User.count' do
      post users_path, params: {user: {username: "", name: "", email: "invalid",
                                        password: "xxxxxxxx", password_confirmation: "yyyyyyyy"}}
    end
    # assert it redirects to the new user page
    assert_template 'users/new'
  end

  test "valid user information" do
    get new_user_path
    assert_difference 'User.count', 1 do
      post users_path, params: {user: {username: "integration_test", name: "Integration Test", email: "integration@test.co.uk",
                                        password: "password", password_confirmation: "password"}}
    end
    follow_redirect!
    assert_template 'users/show'
  end

end
