require "test_helper"

class Lists::PositionControllerTest < ActionDispatch::IntegrationTest
  test "should get update" do
    get lists_position_update_url
    assert_response :success
  end
end
