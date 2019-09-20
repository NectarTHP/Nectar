require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get about_us" do
    get static_pages_about_us_url
    assert_response :success
  end

  test "should get contact_us" do
    get static_pages_contact_us_url
    assert_response :success
  end

  test "should get legal_information" do
    get static_pages_legal_information_url
    assert_response :success
  end

end
