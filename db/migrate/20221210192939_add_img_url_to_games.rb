class AddImgUrlToGames < ActiveRecord::Migration[7.0]
  def change
    add_column :games, :img_url, :string, default: "default_movie_poster.jpg"
  end
end
