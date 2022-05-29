require "application_system_test_case"

class LineaRequesicionsTest < ApplicationSystemTestCase
  setup do
    @linea_requesicion = linea_requesicions(:one)
  end

  test "visiting the index" do
    visit linea_requesicions_url
    assert_selector "h1", text: "Linea requesicions"
  end

  test "should create linea requesicion" do
    visit linea_requesicions_url
    click_on "New linea requesicion"

    click_on "Create Linea requesicion"

    assert_text "Linea requesicion was successfully created"
    click_on "Back"
  end

  test "should update Linea requesicion" do
    visit linea_requesicion_url(@linea_requesicion)
    click_on "Edit this linea requesicion", match: :first

    click_on "Update Linea requesicion"

    assert_text "Linea requesicion was successfully updated"
    click_on "Back"
  end

  test "should destroy Linea requesicion" do
    visit linea_requesicion_url(@linea_requesicion)
    click_on "Destroy this linea requesicion", match: :first

    assert_text "Linea requesicion was successfully destroyed"
  end
end
