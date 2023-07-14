# frozen_string_literal: true

module Cars
  class ModelsController < ApplicationController
    def index
      @models = if params[:make].blank?
                  Car.all.pluck(:model).uniq.map { |model| [model, model] }
                else
                  Car.where(make: params[:make]).pluck(:model).uniq.map { |model| [model, model] }
                end

      respond_to do |format|
        format.turbo_stream
      end
    end
  end
end
