require "test_helper"

class RolControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get rol_index_url
    assert_response :success
  end
end
