class Api::V1::CountriesController < ApplicationController
  # GET /api/v1/countries
  def index
    render json: CountriesSerializer.new(Country.all), status: 200
  end

  # def show  

  # end
end