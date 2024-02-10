class Api::V1::BreadsController < ApplicationController
  # GET /api/v1/breads
  def index
    render json: BreadSerializer.new(Bread.all), status: 200
  end
  # GET /api/v1/breads/:bread_name
  def show
    bread = Bread.find_by(name: params[:id].capitalize)
    render json: BreadSerializer.new(bread), status: 200
  end
end