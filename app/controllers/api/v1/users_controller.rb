class Api::V1::UsersController < ApplicationController

  def index
    render json: User.all
  end

  def show
    render json: User.find(params[:id])
  end

  def create
    user = User.new(user_params)
    if user.save
      render partial: 'users/user_info', locals: {user: user}
    else
      render json: {}, status: :forbidden
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :ssn)
  end
end
