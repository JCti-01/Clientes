require "application_system_test_case"

class ClientAddressesTest < ApplicationSystemTestCase
  setup do
    @client_address = client_addresses(:one)
  end

  test "visiting the index" do
    visit client_addresses_url
    assert_selector "h1", text: "Client addresses"
  end

  test "should create client address" do
    visit client_addresses_url
    click_on "New client address"

    fill_in "Address", with: @client_address.address
    fill_in "City", with: @client_address.city
    fill_in "Client", with: @client_address.client_id
    fill_in "Number", with: @client_address.number
    fill_in "Reference", with: @client_address.reference
    fill_in "State", with: @client_address.state
    fill_in "Zip", with: @client_address.zip
    click_on "Create Client address"

    assert_text "Client address was successfully created"
    click_on "Back"
  end

  test "should update Client address" do
    visit client_address_url(@client_address)
    click_on "Edit this client address", match: :first

    fill_in "Address", with: @client_address.address
    fill_in "City", with: @client_address.city
    fill_in "Client", with: @client_address.client_id
    fill_in "Number", with: @client_address.number
    fill_in "Reference", with: @client_address.reference
    fill_in "State", with: @client_address.state
    fill_in "Zip", with: @client_address.zip
    click_on "Update Client address"

    assert_text "Client address was successfully updated"
    click_on "Back"
  end

  test "should destroy Client address" do
    visit client_address_url(@client_address)
    click_on "Destroy this client address", match: :first

    assert_text "Client address was successfully destroyed"
  end
end
