require 'test_helper'

class NutritionalInformationsControllerTest < ActionController::TestCase
  setup do
    @nutritional_information = nutritional_informations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:nutritional_informations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create nutritional_information" do
    assert_difference('NutritionalInformation.count') do
      post :create, nutritional_information: { energy: @nutritional_information.energy, fat: @nutritional_information.fat, food_id: @nutritional_information.food_id, hydrates: @nutritional_information.hydrates, proteins: @nutritional_information.proteins }
    end

    assert_redirected_to nutritional_information_path(assigns(:nutritional_information))
  end

  test "should show nutritional_information" do
    get :show, id: @nutritional_information
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @nutritional_information
    assert_response :success
  end

  test "should update nutritional_information" do
    put :update, id: @nutritional_information, nutritional_information: { energy: @nutritional_information.energy, fat: @nutritional_information.fat, food_id: @nutritional_information.food_id, hydrates: @nutritional_information.hydrates, proteins: @nutritional_information.proteins }
    assert_redirected_to nutritional_information_path(assigns(:nutritional_information))
  end

  test "should destroy nutritional_information" do
    assert_difference('NutritionalInformation.count', -1) do
      delete :destroy, id: @nutritional_information
    end

    assert_redirected_to nutritional_informations_path
  end
end
