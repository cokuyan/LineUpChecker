class PlayersController < ApplicationController
  def create
    @player = Player.new(player_params)
    if @player.save
      flash[:notice] = "Player saved"
    else
      flash[:notice] = @player.errors.full_messages
    end
    redirect_to school_url(@player.school_id)
  end

  def destroy
    @player = Player.find(params[:id])
    @player.destroy
    redirect_to school_url(@player.school_id)
  end

  private

  def player_params
    params.require(:player).permit(:name, :school_id, :rank, :gender)
  end
end
