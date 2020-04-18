require 'test_helper'

class AccountControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get account_create_url
    assert_response :success
  end

  test "should get store" do
    get account_store_url
    assert_response :success
  end

end
