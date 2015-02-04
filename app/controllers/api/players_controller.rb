class Api::PlayersController < ApplicationController
  def index
    @school = School.find(params[:school_id])

    render json: @school.players
  end
end
