require 'test_helper'

class ArtworksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @artwork = artworks(:one)
  end

  test "should get index" do
    get artworks_url
    assert_response :success
  end

  test "should get new" do
    get new_artwork_url
    assert_response :success
  end

  test "should create artwork" do
    assert_difference('Artwork.count') do
      post artworks_url, params: { artwork: { categorie: @artwork.categorie, description: @artwork.description, name: @artwork.name, picture_url: @artwork.picture_url, price: @artwork.price, sale: @artwork.sale, height: @artwork.height, width: @artwork.width, tag: @artwork.tag, user_id: @artwork.user_id, weight: @artwork.weight } }
    end

    assert_redirected_to artwork_url(Artwork.last)
  end

  test "should show artwork" do
    get artwork_url(@artwork)
    assert_response :success
  end

  test "should get edit" do
    get edit_artwork_url(@artwork)
    assert_response :success
  end

  test "should update artwork" do
    patch artwork_url(@artwork), params: { artwork: { categorie: @artwork.categorie, description: @artwork.description, name: @artwork.name, picture_url: @artwork.picture_url, price: @artwork.price, sale: @artwork.sale, size: @artwork.size, tag: @artwork.tag, user_id: @artwork.user_id, weight: @artwork.weight } }
    assert_redirected_to artwork_url(@artwork)
  end

  test "should destroy artwork" do
    assert_difference('Artwork.count', -1) do
      delete artwork_url(@artwork)
    end

    assert_redirected_to artworks_url
  end
end
