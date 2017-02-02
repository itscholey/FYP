require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new(username: "test_user", email: "example@example.com", name: "Test User Name")
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

end
