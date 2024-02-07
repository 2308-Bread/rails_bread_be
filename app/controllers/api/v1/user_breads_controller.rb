class Api::V1::UserBreadsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :not_found_response
  def index

  end

  def create
    user = User.find(params[:user_id])
    bread = Bread.find(params[:bread_id])
    user_bread = UserBread.create({ user_id: user.id, bread_id: bread.id })
    render json: UserBreadSerializer.new(user_bread).serialized_response, status: 201
  end

  def destroy
    user = User.find(params[:user_id])
    bread = Bread.find(params[:bread_id])
    user_bread = UserBread.find_by( user_id: user.id, bread_id: bread.id )
    user_bread.destroy
    render json: { "message": "Successfully removed bread from your BreadBox"}, status: 200
  end

  private
  def not_found_response(exception)
    render json: ErrorSerializer.new(ErrorMessage.new(exception.message, 404)), status: :not_found
  end
end