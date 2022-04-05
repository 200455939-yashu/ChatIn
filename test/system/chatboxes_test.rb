require "application_system_test_case"

class ChatboxesTest < ApplicationSystemTestCase
  setup do
    @chatbox = chatboxes(:one)
  end

  test "visiting the index" do
    visit chatboxes_url
    assert_selector "h1", text: "Chatboxes"
  end

  test "creating a Chatbox" do
    visit chatboxes_url
    click_on "New Chatbox"

    check "Is private" if @chatbox.is_private
    fill_in "Name", with: @chatbox.name
    click_on "Create Chatbox"

    assert_text "Chatbox was successfully created"
    click_on "Back"
  end

  test "updating a Chatbox" do
    visit chatboxes_url
    click_on "Edit", match: :first

    check "Is private" if @chatbox.is_private
    fill_in "Name", with: @chatbox.name
    click_on "Update Chatbox"

    assert_text "Chatbox was successfully updated"
    click_on "Back"
  end

  test "destroying a Chatbox" do
    visit chatboxes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Chatbox was successfully destroyed"
  end
end
