# frozen_string_literal: true

class SearchesController < ApplicationController
  def new; end

  def create
    @cars = Car.where(search_params)
    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to root_path(search: search_params) }
    end
  end

  private

  def search_params
    params.permit(:make, :model, :year)
  end
end
