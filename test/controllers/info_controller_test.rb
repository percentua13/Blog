require 'test_helper'

class InfoControllerTest < ActionDispatch::IntegrationTest
  test "should get hello" do
    get info_hello_url
    assert_response :success
  end

end
