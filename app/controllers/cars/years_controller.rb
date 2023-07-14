# frozen_string_literal: true

module Cars
  class YearsController < ApplicationController
    def index
      if params[:make].present? && params[:model].present?
        @years = Car.where(make: params[:make], model: params[:model]).pluck(:year).uniq.map { |year| [year, year] }
      end

      respond_to do |format|
        format.turbo_stream
      end
    end
  end
end
