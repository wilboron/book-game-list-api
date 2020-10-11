# frozen_string_literal: true

class Api::V1::AuthorsController < ApplicationController
  before_action :set_author, only: %i[show update destroy]

  # GET /api/v1/authors
  def index
    @authors = Author.all

    render json: @authors
  end

  # GET /api/v1/authors/1
  def show
    render json: @author
  end

  # POST /api/v1/authors
  def create
    @author = Author.new(author_params)

    if @author.save
      render json: @author, status: :created
    else
      render json: @author.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/authors/1
  def update
    if @author.update(author_params)
      render json: @author
    else
      render json: @author.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/authors/1
  def destroy
    @author.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_author
    @author = Author.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def author_params
    params.require(:author).permit(:name)
  end
end
