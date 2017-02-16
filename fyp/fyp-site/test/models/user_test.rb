require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new(username: "test_user", email: "example@example.com", name: "Test User Name",
                      password: "password", password_confirmation: "password")
  end

  test "user should be valid" do
    assert @user.valid?
  end

  test "username should be present" do
    @user.username = " "
    assert_not @user.valid?
  end

  test "email should be present" do
    @user.email = " "
    assert_not @user.valid?
  end

  test "name should be present" do
    @user.name = " "
    assert_not @user.valid?
  end

  test "name should not be too long" do
    @user.name = "x" * 51
    assert_not @user.valid?
  end

  test "username should not be too long" do
    @user.username = "x" * 11
    assert_not @user.valid?
  end

  test "email should not be too long" do
    @user.email = "x" * 255
    assert_not @user.valid?
  end

  test "password should not be blank" do
    @user.password = @user.password_confirmation = " " * 6
    assert_not @user.valid?
  end

  test "password should not be too short" do
    @user.password = @user.password_confirmation = "x" * 7
    assert_not @user.valid?
  end

end