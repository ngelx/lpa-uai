require 'test_helper'

class ExpedientsControllerTest < ActionController::TestCase
  setup do
    @expedient = expedients(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:expedients)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create expedient" do
    assert_difference('Expedient.count') do
      post :create, expedient: { category_id: @expedient.category_id, details: @expedient.details, presentation: @expedient.presentation, student_id: @expedient.student_id }
    end

    assert_redirected_to expedient_path(assigns(:expedient))
  end

  test "should show expedient" do
    get :show, id: @expedient
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @expedient
    assert_response :success
  end

  test "should update expedient" do
    put :update, id: @expedient, expedient: { category_id: @expedient.category_id, details: @expedient.details, presentation: @expedient.presentation, student_id: @expedient.student_id }
    assert_redirected_to expedient_path(assigns(:expedient))
  end

  test "should destroy expedient" do
    assert_difference('Expedient.count', -1) do
      delete :destroy, id: @expedient
    end

    assert_redirected_to expedients_path
  end
end
