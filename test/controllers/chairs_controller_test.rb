require "test_helper"

class ChairsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @chair = chairs(:one)
  end

  test "should get index" do
    get chairs_url
    assert_response :success
  end

  test "should get new" do
    get new_chair_url
    assert_response :success
  end

  test "should create chair" do
    assert_difference("Chair.count") do
      post chairs_url, params: { chair: { brand: @chair.brand, description: @chair.description, name: @chair.name, price: @chair.price } }
    end

    assert_redirected_to chair_url(Chair.last)
  end

  test "should show chair" do
    get chair_url(@chair)
    assert_response :success
  end

  test "should get edit" do
    get edit_chair_url(@chair)
    assert_response :success
  end

  test "should update chair" do
    patch chair_url(@chair), params: { chair: { brand: @chair.brand, description: @chair.description, name: @chair.name, price: @chair.price } }
    assert_redirected_to chair_url(@chair)
  end

  test "should destroy chair" do
    assert_difference("Chair.count", -1) do
      delete chair_url(@chair)
    end

    assert_redirected_to chairs_url
  end
end
