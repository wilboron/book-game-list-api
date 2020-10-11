# frozen_string_literal: true

class Api::V1::GamesController < ApplicationController
  before_action :set_game, only: %i[show update destroy]

  # GET /api/v1/games
  def index
    @games = Game.all

    render json: @games
  end

  # GET /api/v1/games/1
  def show
    render json: @game
  end

  # POST /api/v1/games
  def create
    @game = Game.new(game_params)

    if @game.save
      render json: @game, status: :created
    else
      render json: @game.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/games/1
  def update
    if @game.update(game_params)
      render json: @game
    else
      render json: @game.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/games/1
  def destroy
    @game.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_game
    @game = Game.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def game_params
    params.require(:game).permit(:title, :developer_id, :serie, :genre, :pub_date)
  end
end
