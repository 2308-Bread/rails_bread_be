class Api::V1::CountriesController < ApplicationController
  # GET /api/v1/countries
  def index
    render json: CountrySerializer.new(Country.all), status: 200
  end
  # GET /api/v1/countries/:id
  def show  
    country = Country.find_by(name: params[:id].capitalize)
    if country != nil
      render json: CountryBreadSerializer.new(country, country.breads).serialized_response, status:200
    else
      render json: { error: "Cannot find country with name #{params[:id]}", status: 404 }, status: :not_found
    end
  end
end