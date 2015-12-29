require 'test_helper'

class PlanestatesControllerTest < ActionController::TestCase
  setup do
    @planestate = planestates(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:planestates)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create planestate" do
    assert_difference('Planestate.count') do
      post :create, planestate: { start_time: @planestate.start_time, stateinfo: @planestate.stateinfo }
    end

    assert_redirected_to planestate_path(assigns(:planestate))
  end

  test "should show planestate" do
    get :show, id: @planestate
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @planestate
    assert_response :success
  end

  test "should update planestate" do
    patch :update, id: @planestate, planestate: { start_time: @planestate.start_time, stateinfo: @planestate.stateinfo }
    assert_redirected_to planestate_path(assigns(:planestate))
  end

  test "should destroy planestate" do
    assert_difference('Planestate.count', -1) do
      delete :destroy, id: @planestate
    end

    assert_redirected_to planestates_path
  end
end
