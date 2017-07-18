require 'test_helper'

class ChowsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get chows_show_url
    assert_response :success
  end

end
