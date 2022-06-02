require "test_helper"

class NoUserControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get no_user_index_url
    assert_response :success
  end
end
