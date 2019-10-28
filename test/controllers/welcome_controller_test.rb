require 'test_helper'

class WelcomeControllerTest < ActionDispatch::IntegrationTest
  test "should get user" do
    get welcome_user_url
    assert_response :success
  end

end
