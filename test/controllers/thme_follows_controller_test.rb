require 'test_helper'

class ThmeFollowsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get thme_follows_create_url
    assert_response :success
  end

end
