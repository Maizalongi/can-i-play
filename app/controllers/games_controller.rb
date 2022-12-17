class GamesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  def index
    if params[:query].present?
      @games = Game.search_game_by_name(params[:query])
    else
      @games = Game.all
    end
  end

  def show
    @game = Game.find(params[:id])
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)
    @game.user = current_user
    if @game.save
      redirect_to game_path(@game)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @game = Game.find(params[:id])
  end

  def update
    @game = Game.find(params[:id])
    @game.update(game_params)
    redirect_to game_path(@game)
  end

  def destroy
    @game = Game.find(params[:id])
    @game.destroy
    redirect_to games_path, status: :see_other
  end

  def my_games
    @games = Game.where(user: current_user)
  end

  def add_to_wishlist
    @game = Game.find(params[:id])
    if current_user.wishlist
      current_user.wishlist.games << @game
    else
      @wishlist = Wishlist.create(user: current_user)
      current_user.wishlist.games << @game
    end
    redirect_to game_path(@game)
  end

  def remove_of_wishlist
    @game = Game.find(params[:id])
    current_user.wishlist.games.delete(@game)
    redirect_to game_path(@game)
  end
end

private

def game_params
  params.require(:game).permit(:name, :price, :description, :active, :category_id, :console_id, :user_id, :image)
end
