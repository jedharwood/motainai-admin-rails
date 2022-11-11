# frozen_string_literal: true

class WasteTypeController < ApplicationController
    def new
        @rule_days = RuleDay.where(city_id: params[:format]).order(:code)
    end
end
