class MoviesController < ApplicationController

  def index
    movies = MoviesService.index params
    render json: movies[:data], status: movies[:status]
  end

  def show
    movie = MoviesService.show params
    render json: movie[:data], status: movie[:status]
  end
end