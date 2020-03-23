require 'test_helper'

class SlotCategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @slot_category = slot_categories(:one)
  end

  test "should get index" do
    get slot_categories_url
    assert_response :success
  end

  test "should get new" do
    get new_slot_category_url
    assert_response :success
  end

  test "should create slot_category" do
    assert_difference('SlotCategory.count') do
      post slot_categories_url, params: { slot_category: {  } }
    end

    assert_redirected_to slot_category_url(SlotCategory.last)
  end

  test "should show slot_category" do
    get slot_category_url(@slot_category)
    assert_response :success
  end

  test "should get edit" do
    get edit_slot_category_url(@slot_category)
    assert_response :success
  end

  test "should update slot_category" do
    patch slot_category_url(@slot_category), params: { slot_category: {  } }
    assert_redirected_to slot_category_url(@slot_category)
  end

  test "should destroy slot_category" do
    assert_difference('SlotCategory.count', -1) do
      delete slot_category_url(@slot_category)
    end

    assert_redirected_to slot_categories_url
  end
end
