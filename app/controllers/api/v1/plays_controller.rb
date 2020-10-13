# frozen_string_literal: true

class Api::V1::PlaysController < ApplicationController
  before_action :set_play, only: %i[show update destroy]
  before_action :check_login
  before_action :check_owner, only: %i[update destroy]

  # GET /plays
  def index
    @plays = Play.all

    render json: @plays
  end

  # GET /plays/1
  def show
    render json: @play
  end

  # POST /plays
  def create
    @play = current_user.plays.build(play_params)

    if @play.save
      render json: @play, status: :created
    else
      render json: @play.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /plays/1
  def update
    if @play.update(play_params)
      render json: @play
    else
      render json: @play.errors, status: :unprocessable_entity
    end
  end

  # DELETE /plays/1
  def destroy
    @play.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_play
    @play = Play.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def play_params
    params.require(:play).permit(:did_not_finished, :minutes_played, :plataform, :start_date, :end_date, :game_id)
  end

  def check_owner
    return head(:forbidden) if @play.user_id != current_user.id
  end
end
