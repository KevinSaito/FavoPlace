require "test_helper"

class Public::FavoImagesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get public_favo_images_new_url
    assert_response :success
  end

  test "should get index" do
    get public_favo_images_index_url
    assert_response :success
  end

  test "should get show" do
    get public_favo_images_show_url
    assert_response :success
  end

  test "should get edit" do
    get public_favo_images_edit_url
    assert_response :success
  end
end
