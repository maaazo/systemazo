require "application_system_test_case"

class ClientIntakeFormsTest < ApplicationSystemTestCase
  setup do
    @client_intake_form = client_intake_forms(:one)
  end

  test "visiting the index" do
    visit client_intake_forms_url
    assert_selector "h1", text: "Client intake forms"
  end

  test "should create client intake form" do
    visit client_intake_forms_url
    click_on "New client intake form"

    click_on "Create Client intake form"

    assert_text "Client intake form was successfully created"
    click_on "Back"
  end

  test "should update Client intake form" do
    visit client_intake_form_url(@client_intake_form)
    click_on "Edit this client intake form", match: :first

    click_on "Update Client intake form"

    assert_text "Client intake form was successfully updated"
    click_on "Back"
  end

  test "should destroy Client intake form" do
    visit client_intake_form_url(@client_intake_form)
    click_on "Destroy this client intake form", match: :first

    assert_text "Client intake form was successfully deleted"
  end
end
