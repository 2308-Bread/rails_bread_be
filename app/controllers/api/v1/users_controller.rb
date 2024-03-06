class Api::V1::UsersController < ApplicationController
  # GET /api/v1/users
  def index
    render json: UserSerializer.new(User.all), status: 200
  end
# GET /api/v1/users/:id
  def show
    # require 'pry';binding.pry
    user = User.find(params[:id])
    render json: UserSerializer.new(user), status: 200
  end
# POST /api/v1/users
  def create
    user = User.new(user_params)

    if User.exists?(email: user.email)
      render json: email_error(user), status: :unprocessable_entity
    elsif user.password != user.password_confirmation
      render json: password_error(user), status: :unprocessable_entity
    else user.save
      render json: UserSerializer.new(user), status: :created
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def password_error(user)
    {
      error: "Passwords do not match.",
      status: 422
    }
  end

  def email_error(user)
    {
      error: "This email already has an account with us.",
      status: 422
    }
  end
end