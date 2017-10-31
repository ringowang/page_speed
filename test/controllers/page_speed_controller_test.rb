require 'test_helper'

class PageSpeedControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get page_speed_new_url
    assert_response :success
  end
end
