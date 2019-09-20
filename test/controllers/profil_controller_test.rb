require 'test_helper'

class ProfilControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get profil_index_url
    assert_response :success
  end

  test "should get show" do
    get profil_show_url
    assert_response :success
  end

  test "should get new" do
    get profil_new_url
    assert_response :success
  end

  test "should get edit" do
    get profil_edit_url
    assert_response :success
  end

end
