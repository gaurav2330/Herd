class GenresController < ApplicationController

  def index
    genres = GenresService.index params
    render json: genres[:data], status: genres[:status]
  end
end