class CreateJoinTableWishlistGame < ActiveRecord::Migration[7.0]
  def change
    create_join_table :wishlists, :games do |t|
      t.index [:wishlist_id, :game_id]
      t.index [:game_id, :wishlist_id]
    end
  end
end
