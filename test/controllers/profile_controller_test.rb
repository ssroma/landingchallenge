require "test_helper"

class ProfileControllerTest < ActionDispatch::IntegrationTest
  test "should get getProfileByUser" do
    get profile_getProfileByUser_url
    assert_response :success
  end

  test "should get fetchProfileByUser" do
    get profile_fetchProfileByUser_url
    assert_response :success
  end

  test "should get fetch" do
    get profile_fetch_url
    assert_response :success
  end

  test "should get show" do
    get profile_show_url
    assert_response :success
  end

  test "should get compare" do
    get profile_compare_url
    assert_response :success
  end

  test "should get create" do
    get profile_create_url
    assert_response :success
  end

  test "should get destroy" do
    get profile_destroy_url
    assert_response :success
  end
end
