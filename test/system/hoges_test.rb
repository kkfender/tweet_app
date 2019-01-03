require "application_system_test_case"

class HogesTest < ApplicationSystemTestCase
  setup do
    @hoge = hoges(:one)
  end

  test "visiting the index" do
    visit hoges_url
    assert_selector "h1", text: "Hoges"
  end

  test "creating a Hoge" do
    visit hoges_url
    click_on "New Hoge"

    fill_in "Age", with: @hoge.age
    fill_in "Name", with: @hoge.name
    click_on "Create Hoge"

    assert_text "Hoge was successfully created"
    click_on "Back"
  end

  test "updating a Hoge" do
    visit hoges_url
    click_on "Edit", match: :first

    fill_in "Age", with: @hoge.age
    fill_in "Name", with: @hoge.name
    click_on "Update Hoge"

    assert_text "Hoge was successfully updated"
    click_on "Back"
  end

  test "destroying a Hoge" do
    visit hoges_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Hoge was successfully destroyed"
  end
end
