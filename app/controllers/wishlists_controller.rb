class WishlistsController < ApplicationController
  def index
    if current_user.wishlist
      @wishlist = current_user.wishlist
    else
      @wishlist = Wishlist.create(user: current_user)
    end
  end
end
