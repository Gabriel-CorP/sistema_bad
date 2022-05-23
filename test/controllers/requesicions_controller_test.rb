require "test_helper"

class RequesicionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @requesicion = requesicions(:one)
  end

  test "should get index" do
    get requesicions_url
    assert_response :success
  end

  test "should get new" do
    get new_requesicion_url
    assert_response :success
  end

  test "should create requesicion" do
    assert_difference("Requesicion.count") do
      post requesicions_url, params: { requesicion: {  } }
    end

    assert_redirected_to requesicion_url(Requesicion.last)
  end

  test "should show requesicion" do
    get requesicion_url(@requesicion)
    assert_response :success
  end

  test "should get edit" do
    get edit_requesicion_url(@requesicion)
    assert_response :success
  end

  test "should update requesicion" do
    patch requesicion_url(@requesicion), params: { requesicion: {  } }
    assert_redirected_to requesicion_url(@requesicion)
  end

  test "should destroy requesicion" do
    assert_difference("Requesicion.count", -1) do
      delete requesicion_url(@requesicion)
    end

    assert_redirected_to requesicions_url
  end
end
