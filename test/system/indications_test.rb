require "application_system_test_case"

class IndicationsTest < ApplicationSystemTestCase
  setup do
    @indication = indications(:one)
  end

  test "visiting the index" do
    visit indications_url
    assert_selector "h1", text: "Indications"
  end

  test "creating a Indication" do
    visit indications_url
    click_on "New Indication"

    fill_in "Id", with: @indication.id
    fill_in "Movie", with: @indication.movie_id
    fill_in "Plataform", with: @indication.plataform_id
    fill_in "User", with: @indication.user_id
    click_on "Create Indication"

    assert_text "Indication was successfully created"
    click_on "Back"
  end

  test "updating a Indication" do
    visit indications_url
    click_on "Edit", match: :first

    fill_in "Id", with: @indication.id
    fill_in "Movie", with: @indication.movie_id
    fill_in "Plataform", with: @indication.plataform_id
    fill_in "User", with: @indication.user_id
    click_on "Update Indication"

    assert_text "Indication was successfully updated"
    click_on "Back"
  end

  test "destroying a Indication" do
    visit indications_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Indication was successfully destroyed"
  end
end
