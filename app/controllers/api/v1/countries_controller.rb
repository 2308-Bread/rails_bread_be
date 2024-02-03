class Api::V1::CountriesController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :not_found_response

  # GET /api/v1/countries
  def index
    render json: CountrySerializer.new(Country.all), status: 200
  end
  # GET /api/v1/countries/:id
  def show  
    country = Country.find(params[:id])
    render json: { country: CountrySerializer.new(country), breads: BreadSerializer.new(country.breads) }, status:200
  end

  private
  def not_found_response(exception)
    render json: ErrorSerializer.new(ErrorMessage.new(exception.message, 404)), status: :not_found
  end
end