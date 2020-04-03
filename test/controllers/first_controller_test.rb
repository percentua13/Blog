require 'test_helper'

class FirstControllerTest < ActionDispatch::IntegrationTest
  test "should get HelloWorld" do
    get first_HelloWorld_url
    assert_response :success
  end

end
