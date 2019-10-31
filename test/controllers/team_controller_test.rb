require 'test_helper'

class TeamControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get team_show_url
    assert_response :success
  end

end
