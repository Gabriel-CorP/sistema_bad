require "application_system_test_case"

class RequesicionsTest < ApplicationSystemTestCase
  setup do
    @requesicion = requesicions(:one)
  end

  test "visiting the index" do
    visit requesicions_url
    assert_selector "h1", text: "Requesicions"
  end

  test "should create requesicion" do
    visit requesicions_url
    click_on "New requesicion"

    click_on "Create Requesicion"

    assert_text "Requesicion was successfully created"
    click_on "Back"
  end

  test "should update Requesicion" do
    visit requesicion_url(@requesicion)
    click_on "Edit this requesicion", match: :first

    click_on "Update Requesicion"

    assert_text "Requesicion was successfully updated"
    click_on "Back"
  end

  test "should destroy Requesicion" do
    visit requesicion_url(@requesicion)
    click_on "Destroy this requesicion", match: :first

    assert_text "Requesicion was successfully destroyed"
  end
end
