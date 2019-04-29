require 'test_helper'

class DatersControllerTest < ActionController::TestCase
  setup do
    @dater = daters(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:daters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create dater" do
    assert_difference('Dater.count') do
      post :create, dater: { age: @dater.age, gender: @dater.gender, name: @dater.name, password: @dater.password, phone_number: @dater.phone_number, username: @dater.username }
    end

    assert_redirected_to dater_path(assigns(:dater))
  end

  test "should show dater" do
    get :show, id: @dater
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @dater
    assert_response :success
  end

  test "should update dater" do
    patch :update, id: @dater, dater: { age: @dater.age, gender: @dater.gender, name: @dater.name, password: @dater.password, phone_number: @dater.phone_number, username: @dater.username }
    assert_redirected_to dater_path(assigns(:dater))
  end

  test "should destroy dater" do
    assert_difference('Dater.count', -1) do
      delete :destroy, id: @dater
    end

    assert_redirected_to daters_path
  end
end
