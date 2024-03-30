class UsersController < ApplicationController

  def index
    users = UsersService.index params
    render json: users[:data], status: users[:status]
  end

  def show
    user = UsersService.show params
    render json: user[:data], status: user[:status]
  end
  
  def create
    user = UsersService.create user_params
    render json: user[:data], status: user[:status]
  end
  
  def update
    user = UsersService.update params[:id], user_params
    render json: user[:data], status: user[:status]
  end
  
  def destroy
    user = UsersService.destroy params
    render json: user[:data], status: user[:status]
  end

  private

  def user_params
    params.permit(:first_name, :last_name, :email, :sex, :phone_number, :date_of_birth)
  end
end