class Api::V1::BreadsController < ApplicationController
  def show
    bread = Bread.find(params[:id])
    # render json: BreadSerializer.new(bread).serializable_hash.to_json
    render json: BreadSerializer.new(bread), status: 200
  end
end