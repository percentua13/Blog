require 'test_helper'

class HelloControllerTest < ActionDispatch::IntegrationTest
  test "should get init" do
    get hello_init_url
    assert_response :success
  end

end
