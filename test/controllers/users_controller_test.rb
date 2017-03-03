require 'test_helper'

class UsersControllerTest < ActionController::TestCase

  def setup
    @admin    = users(:adminuser)
    @teacher  = users(:teacheruser)
    @parent   = users(:parentuser)
    @student  = users(:studentuser)
  end

  test "should get new" do
  #  get :new
  #  assert_response :success
  end


end
