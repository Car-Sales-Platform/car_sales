# frozen_string_literal: true

module Searches
  class ModelsController < ApplicationController
    def index
      @models = Car.where(make: params[:make_id]).distinct.pluck(:model)
      respond_to do |format|
        format.turbo_stream
      end
    end
  end
end
