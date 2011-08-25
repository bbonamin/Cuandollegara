require 'test_helper'

class BusesControllerTest < ActionController::TestCase
  setup do
    @bus = buses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:buses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create bus" do
    assert_difference('Bus.count') do
      post :create, :bus => @bus.attributes
    end

    assert_redirected_to bus_path(assigns(:bus))
  end

  test "should show bus" do
    get :show, :id => @bus.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @bus.to_param
    assert_response :success
  end

  test "should update bus" do
    put :update, :id => @bus.to_param, :bus => @bus.attributes
    assert_redirected_to bus_path(assigns(:bus))
  end

  test "should destroy bus" do
    assert_difference('Bus.count', -1) do
      delete :destroy, :id => @bus.to_param
    end

    assert_redirected_to buses_path
  end
end
