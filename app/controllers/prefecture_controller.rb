# frozen_string_literal: true

class PrefectureController < ApplicationController
    def show
        @prefecture = Prefecture.find(params[:id])
        @cities = City.where(prefecture_id: @prefecture.id)
    end
end
