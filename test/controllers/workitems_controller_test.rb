require 'test_helper'

class WorkitemsControllerTest < ActionController::TestCase
  setup do
    @workitem = workitems(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:workitems)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create workitem" do
    assert_difference('Workitem.count') do
      post :create, workitem: {  }
    end

    assert_redirected_to workitem_path(assigns(:workitem))
  end

  test "should show workitem" do
    get :show, id: @workitem
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @workitem
    assert_response :success
  end

  test "should update workitem" do
    patch :update, id: @workitem, workitem: {  }
    assert_redirected_to workitem_path(assigns(:workitem))
  end

  test "should destroy workitem" do
    assert_difference('Workitem.count', -1) do
      delete :destroy, id: @workitem
    end

    assert_redirected_to workitems_path
  end
end
