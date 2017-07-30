class Api::V1::UsersController < ApplicationController
  def create
    user = User.new(user_params)
    if user.save
      render partial: 'users/user_info', locals: {user: user}
    else
      render status: 404
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :ssn)
  end
end
