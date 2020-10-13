# frozen_string_literal: true

class Api::V1::ReadsController < ApplicationController
  before_action :set_read, only: %i[show update destroy]
  before_action :check_login
  before_action :check_owner, only: %i[update destroy]

  # GET /reads
  def index
    @reads = Read.all

    render json: @reads
  end

  # GET /reads/1
  def show
    render json: @read
  end

  # POST /reads
  def create
    @read = current_user.reads.build(read_params)

    if @read.save
      render json: @read, status: :created
    else
      render json: @read.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /reads/1
  def update
    if @read.update(read_params)
      render json: @read
    else
      render json: @read.errors, status: :unprocessable_entity
    end
  end

  # DELETE /reads/1
  def destroy
    @read.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_read
    @read = Read.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def read_params
    params.require(:read).permit(:did_not_finished, :medium, :start_date, :end_date, :book_id)
  end

  def check_owner
    return head(:forbidden) if @read.user_id != current_user.id
  end
end
