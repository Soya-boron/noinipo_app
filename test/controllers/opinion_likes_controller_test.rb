require 'test_helper'

class OpinionLikesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get opinion_likes_create_url
    assert_response :success
  end

end
