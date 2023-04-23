# frozen_string_literal: true

# app/controllers/api/v0/forecast_controller.rb
class Api::V0::ForecastController < ApplicationController
  def index
    if params[:location].present?
      forecast = ForecastFacade.new(params[:location]).fetch_forecast
      render json: ForecastSerializer.new(forecast)
    else
      render json: ErrorSerializer.new('A location must be provided').invalid_request, status: 404
    end
  end
end
