require 'test_helper'

class TryControllerTest < ActionDispatch::IntegrationTest
  test "should get tryA" do
    get try_tryA_url
    assert_response :success
  end

end
