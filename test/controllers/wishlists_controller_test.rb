require "test_helper"

class WishlistsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get wishlists_index_url
    assert_response :success
  end
end
