require "test_helper"

class ClientIntakeFormsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @client_intake_form = client_intake_forms(:one)
  end

  test "should get index" do
    get client_intake_forms_url
    assert_response :success
  end

  test "should get new" do
    get new_client_intake_form_url
    assert_response :success
  end

  test "should create client_intake_form" do
    assert_difference("ClientIntakeForm.count") do
      post client_intake_forms_url, params: { client_intake_form: {  } }
    end

    assert_redirected_to client_intake_form_url(ClientIntakeForm.last)
  end

  test "should show client_intake_form" do
    get client_intake_form_url(@client_intake_form)
    assert_response :success
  end

  test "should get edit" do
    get edit_client_intake_form_url(@client_intake_form)
    assert_response :success
  end

  test "should update client_intake_form" do
    patch client_intake_form_url(@client_intake_form), params: { client_intake_form: {  } }
    assert_redirected_to client_intake_form_url(@client_intake_form)
  end

  test "should destroy client_intake_form" do
    assert_difference("ClientIntakeForm.count", -1) do
      delete client_intake_form_url(@client_intake_form)
    end

    assert_redirected_to client_intake_forms_url
  end
end
