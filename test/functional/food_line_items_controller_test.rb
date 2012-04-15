require 'test_helper'

class FoodLineItemsControllerTest < ActionController::TestCase
  setup do
    @food_line_item = food_line_items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:food_line_items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create food_line_item" do
    assert_difference('FoodLineItem.count') do
      post :create, food_line_item: { ammount: @food_line_item.ammount, diet_id: @food_line_item.diet_id, food_id: @food_line_item.food_id }
    end

    assert_redirected_to food_line_item_path(assigns(:food_line_item))
  end

  test "should show food_line_item" do
    get :show, id: @food_line_item
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @food_line_item
    assert_response :success
  end

  test "should update food_line_item" do
    put :update, id: @food_line_item, food_line_item: { ammount: @food_line_item.ammount, diet_id: @food_line_item.diet_id, food_id: @food_line_item.food_id }
    assert_redirected_to food_line_item_path(assigns(:food_line_item))
  end

  test "should destroy food_line_item" do
    assert_difference('FoodLineItem.count', -1) do
      delete :destroy, id: @food_line_item
    end

    assert_redirected_to food_line_items_path
  end
end
