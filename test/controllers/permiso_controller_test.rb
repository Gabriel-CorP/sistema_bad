require "test_helper"

class PermisoControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get permiso_index_url
    assert_response :success
  end
end
