require 'test_helper'

class LandingControllerTest < ActionDispatch::IntegrationTest
  test "should get page" do
    get landing_page_url
    assert_response :success
  end

end
