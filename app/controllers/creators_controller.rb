class CreatorsController < ApplicationController

  def index
    creators = CreatorsService.index params
    render json: creators[:data], status: creators[:status]
  end
end