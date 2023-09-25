require "application_system_test_case"

class LocalesTest < ApplicationSystemTestCase
  setup do
    @locale = locales(:one)
  end

  test "visiting the index" do
    visit locales_url
    assert_selector "h1", text: "Locales"
  end

  test "should create locale" do
    visit locales_url
    click_on "New locale"

    fill_in "Code", with: @locale.code
    fill_in "Description", with: @locale.description
    click_on "Create Locale"

    assert_text "Locale was successfully created"
    click_on "Back"
  end

  test "should update Locale" do
    visit locale_url(@locale)
    click_on "Edit this locale", match: :first

    fill_in "Code", with: @locale.code
    fill_in "Description", with: @locale.description
    click_on "Update Locale"

    assert_text "Locale was successfully updated"
    click_on "Back"
  end

  test "should destroy Locale" do
    visit locale_url(@locale)
    click_on "Destroy this locale", match: :first

    assert_text "Locale was successfully destroyed"
  end
end
