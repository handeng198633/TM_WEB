require 'test_helper'

class TicketstatesControllerTest < ActionController::TestCase
  setup do
    @ticketstate = ticketstates(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ticketstates)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ticketstate" do
    assert_difference('Ticketstate.count') do
      post :create, ticketstate: { start_time: @ticketstate.start_time, stateinfo: @ticketstate.stateinfo }
    end

    assert_redirected_to ticketstate_path(assigns(:ticketstate))
  end

  test "should show ticketstate" do
    get :show, id: @ticketstate
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ticketstate
    assert_response :success
  end

  test "should update ticketstate" do
    patch :update, id: @ticketstate, ticketstate: { start_time: @ticketstate.start_time, stateinfo: @ticketstate.stateinfo }
    assert_redirected_to ticketstate_path(assigns(:ticketstate))
  end

  test "should destroy ticketstate" do
    assert_difference('Ticketstate.count', -1) do
      delete :destroy, id: @ticketstate
    end

    assert_redirected_to ticketstates_path
  end
end
