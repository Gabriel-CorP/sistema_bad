require "application_system_test_case"

class UbicacionsTest < ApplicationSystemTestCase
  setup do
    @ubicacion = ubicacions(:one)
  end

  test "visiting the index" do
    visit ubicacions_url
    assert_selector "h1", text: "Ubicacions"
  end

  test "should create ubicacion" do
    visit ubicacions_url
    click_on "New ubicacion"

    fill_in "Direccion", with: @ubicacion.direccion
    fill_in "Nombre", with: @ubicacion.nombre
    fill_in "Proveedor", with: @ubicacion.proveedor_id
    click_on "Create Ubicacion"

    assert_text "Ubicacion was successfully created"
    click_on "Back"
  end

  test "should update Ubicacion" do
    visit ubicacion_url(@ubicacion)
    click_on "Edit this ubicacion", match: :first

    fill_in "Direccion", with: @ubicacion.direccion
    fill_in "Nombre", with: @ubicacion.nombre
    fill_in "Proveedor", with: @ubicacion.proveedor_id
    click_on "Update Ubicacion"

    assert_text "Ubicacion was successfully updated"
    click_on "Back"
  end

  test "should destroy Ubicacion" do
    visit ubicacion_url(@ubicacion)
    click_on "Destroy this ubicacion", match: :first

    assert_text "Ubicacion was successfully destroyed"
  end
end
