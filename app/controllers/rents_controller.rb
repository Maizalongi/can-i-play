class RentsController < ApplicationController
  def new
    @rent = Rent.new
    @game = Game.find(params[:game_id])
  end

  def create
    @rent = Rent.new(rent_params)
    @user = current_user
    @game = Game.find(params[:game_id])
    @rent.user = @user
    @rent.game = @game
    if @rent.save
      @game.active = false
      @game.save!
      redirect_to game_path(@game)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @rent = Rent.find(params[:id])
  end

  def update
  end

  def destroy
    @rent = Rent.find(params[:id])
    @rent.destroy
    redirect_to rent_path, status: :see_other
  end

  def index
  end

  def show
  end

  def my_rents
    rents = Rent.where(user: current_user)
    games = Game.all
    rented_games = []
    rents.each do |rent|
      games.each do |game|
        rented_games.append(game) if rent.game_id == game.id
      end
    end
    @rented_games = rented_games
  end
end

private

def rent_params
  params.require(:rent).permit(:start_date, :end_date)
end
