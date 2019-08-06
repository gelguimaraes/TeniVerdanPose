require "application_system_test_case"

class PlataformsTest < ApplicationSystemTestCase
  setup do
    @plataform = plataforms(:one)
  end

  test "visiting the index" do
    visit plataforms_url
    assert_selector "h1", text: "Plataforms"
  end

  test "creating a Plataform" do
    visit plataforms_url
    click_on "New Plataform"

    fill_in "Id", with: @plataform.id
    fill_in "Image", with: @plataform.image
    fill_in "Nome", with: @plataform.nome
    click_on "Create Plataform"

    assert_text "Plataform was successfully created"
    click_on "Back"
  end

  test "updating a Plataform" do
    visit plataforms_url
    click_on "Edit", match: :first

    fill_in "Id", with: @plataform.id
    fill_in "Image", with: @plataform.image
    fill_in "Nome", with: @plataform.nome
    click_on "Update Plataform"

    assert_text "Plataform was successfully updated"
    click_on "Back"
  end

  test "destroying a Plataform" do
    visit plataforms_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Plataform was successfully destroyed"
  end
end
