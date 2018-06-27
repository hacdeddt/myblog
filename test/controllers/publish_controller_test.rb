require 'test_helper'

class PublishControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get publish_index_url
    assert_response :success
  end

end
