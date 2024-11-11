require "application_system_test_case"

class ChairsTest < ApplicationSystemTestCase
  setup do
    @chair = chairs(:one)
  end

  test "visiting the index" do
    visit chairs_url
    assert_selector "h1", text: "Chairs"
  end

  test "should create chair" do
    visit chairs_url
    click_on "New chair"

    fill_in "Brand", with: @chair.brand
    fill_in "Description", with: @chair.description
    fill_in "Name", with: @chair.name
    fill_in "Price", with: @chair.price
    click_on "Create Chair"

    assert_text "Chair was successfully created"
    click_on "Back"
  end

  test "should update Chair" do
    visit chair_url(@chair)
    click_on "Edit this chair", match: :first

    fill_in "Brand", with: @chair.brand
    fill_in "Description", with: @chair.description
    fill_in "Name", with: @chair.name
    fill_in "Price", with: @chair.price
    click_on "Update Chair"

    assert_text "Chair was successfully updated"
    click_on "Back"
  end

  test "should destroy Chair" do
    visit chair_url(@chair)
    click_on "Destroy this chair", match: :first

    assert_text "Chair was successfully destroyed"
  end
end
