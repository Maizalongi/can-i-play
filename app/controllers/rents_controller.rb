class RentsController < ApplicationController
  def index
    @rents = Rent.all
  end

  def show
    @rent = Rent.find(params[:id])
  end

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
    @rent = Rent.find(params[:id])
    @rent.update(rent_params)
    redirect_to rent_path(@rent)
  end

  def destroy
    @rent = Rent.find(params[:id])
    @rent.destroy
    redirect_to rent_path, status: :see_other
  end

  def accept
    @rent = Rent.find(params[:id])
    @rent.status = true
    @rent.save
  end

  def deactivate
    @rent = Rent.find(params[:id])
    @rent.status = false
    @rent.save
  end
end

private

def rent_params
  params.require(:rent).permit(:start_date, :end_date)
end
