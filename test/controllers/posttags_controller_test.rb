require 'test_helper'

class PosttagsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @posttag = posttags(:one)
  end

  test "should get index" do
    get posttags_url
    assert_response :success
  end

  test "should get new" do
    get new_posttag_url
    assert_response :success
  end

  test "should create posttag" do
    assert_difference('Posttag.count') do
      post posttags_url, params: { posttag: {  } }
    end

    assert_redirected_to posttag_url(Posttag.last)
  end

  test "should show posttag" do
    get posttag_url(@posttag)
    assert_response :success
  end

  test "should get edit" do
    get edit_posttag_url(@posttag)
    assert_response :success
  end

  test "should update posttag" do
    patch posttag_url(@posttag), params: { posttag: {  } }
    assert_redirected_to posttag_url(@posttag)
  end

  test "should destroy posttag" do
    assert_difference('Posttag.count', -1) do
      delete posttag_url(@posttag)
    end

    assert_redirected_to posttags_url
  end
end
