require 'test_helper'

class ArrivalControllerTest < ActionController::TestCase
  test "should get select" do
    get :select
    assert_response :success
  end

  test "should get show" do
    get :show
    assert_response :success
  end

end
