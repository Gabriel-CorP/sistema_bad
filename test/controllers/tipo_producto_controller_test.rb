require "test_helper"

class TipoProductoControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get tipo_producto_index_url
    assert_response :success
  end
end
