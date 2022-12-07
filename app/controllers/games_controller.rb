class GamesController < ApplicationController
  def index
    @games = Game.all
  end

  def show
    @game = Game.find(params[:id])
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)
    if @game.save
      redirect_to game_path(@game)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @game.find(params[:id])
  end

  def update
    @game = Game.find(params[:id])
    @game.update(game_params)
    redirect_to game_path(@game)
  end

  def destroy
    @game = Game.find(game[:id])
    @game.destroy
    redirect_to game_path, status: :see_other
  end
end

private

def game_params
  params.require(:game).permit(:name, :price, :description, :active, :category_id, :console_id, :user_id)
end
