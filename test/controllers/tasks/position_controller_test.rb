require "test_helper"

class Tasks::PositionControllerTest < ActionDispatch::IntegrationTest
  test "should get update" do
    get tasks_position_update_url
    assert_response :success
  end
end
