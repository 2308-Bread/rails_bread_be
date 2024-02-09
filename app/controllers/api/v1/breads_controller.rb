class Api::V1::BreadsController < ApplicationController
  def show
    bread = Bread.find_by(name: params[:id].capitalize)
    render json: BreadSerializer.new(bread), status: 200
  end
end