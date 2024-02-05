class Api::V1::UserBreadsController < ApplicationController

  def index

  end

  def create
    bread = params[:bread_id]
    user = params[:user_id]
    
    user_bread = UserBread.create!({ user_id: user, bread_id: bread })
    render json: {  }

  end

  def destroy

  end
end