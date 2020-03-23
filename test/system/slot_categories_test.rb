require "application_system_test_case"

class SlotCategoriesTest < ApplicationSystemTestCase
  setup do
    @slot_category = slot_categories(:one)
  end

  test "visiting the index" do
    visit slot_categories_url
    assert_selector "h1", text: "Slot Categories"
  end

  test "creating a Slot category" do
    visit slot_categories_url
    click_on "New Slot Category"

    click_on "Create Slot category"

    assert_text "Slot category was successfully created"
    click_on "Back"
  end

  test "updating a Slot category" do
    visit slot_categories_url
    click_on "Edit", match: :first

    click_on "Update Slot category"

    assert_text "Slot category was successfully updated"
    click_on "Back"
  end

  test "destroying a Slot category" do
    visit slot_categories_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Slot category was successfully destroyed"
  end
end
