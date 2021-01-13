require 'test_helper'

class OpinionsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get opinions_show_url
    assert_response :success
  end

end
