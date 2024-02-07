class Api::V1::UserBreadsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :not_found_response
  before_action :find_user, :find_bread, only: %i[ create destroy ] 
  
# POST /api/v1/user_breads
  def create
    user_bread = UserBread.create({ user_id: @user.id, bread_id: @bread.id })
    render json: UserBreadSerializer.new(user_bread).serialized_response, status: 201
  end
# DELETE /api/v1/user_breads/:user_bread_id
  def destroy
    user_bread = UserBread.find_by( user_id: @user.id, bread_id: @bread.id )
    user_bread.destroy
    render json: { "message": "Successfully removed bread from your BreadBox"}, status: 200
  end

  private
  def not_found_response(exception)
    render json: ErrorSerializer.new(ErrorMessage.new(exception.message, 404)), status: :not_found
  end

  def find_user
    @user = User.find(params[:user_id])
  end

  def find_bread
   @bread = Bread.find(params[:bread_id])
  end
end