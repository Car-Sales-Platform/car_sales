# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    return if params[:search].blank?

    @cars = Car.where(search_params)
  end

  def search_params
    params[:search].permit(:make, :model, :year)
  end
end
