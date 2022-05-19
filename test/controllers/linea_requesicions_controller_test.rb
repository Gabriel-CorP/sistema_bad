require "test_helper"

class LineaRequesicionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @linea_requesicion = linea_requesicions(:one)
  end

  test "should get index" do
    get linea_requesicions_url
    assert_response :success
  end

  test "should get new" do
    get new_linea_requesicion_url
    assert_response :success
  end

  test "should create linea_requesicion" do
    assert_difference("LineaRequesicion.count") do
      post linea_requesicions_url, params: { linea_requesicion: {  } }
    end

    assert_redirected_to linea_requesicion_url(LineaRequesicion.last)
  end

  test "should show linea_requesicion" do
    get linea_requesicion_url(@linea_requesicion)
    assert_response :success
  end

  test "should get edit" do
    get edit_linea_requesicion_url(@linea_requesicion)
    assert_response :success
  end

  test "should update linea_requesicion" do
    patch linea_requesicion_url(@linea_requesicion), params: { linea_requesicion: {  } }
    assert_redirected_to linea_requesicion_url(@linea_requesicion)
  end

  test "should destroy linea_requesicion" do
    assert_difference("LineaRequesicion.count", -1) do
      delete linea_requesicion_url(@linea_requesicion)
    end

    assert_redirected_to linea_requesicions_url
  end
end
