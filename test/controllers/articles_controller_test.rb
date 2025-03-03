require "test_helper"

class ArticlesControllerTest < ActionDispatch::IntegrationTest
  test "should get login" do
    get articles_login_url
    assert_response :success
  end

  test "should get user" do
    get articles_user_url
    assert_response :success
  end
end
