require 'test_helper'

class HomesControllerTest < ActionDispatch::IntegrationTest
  test "should get about" do
    get homes_about_url
    assert_response :success
  end

  test "should get contact" do
    get homes_contact_url
    assert_response :success
  end

  test "should get news" do
    get homes_news_url
    assert_response :success
  end

end
