# frozen_string_literal: true

class PrefectureController < ApplicationController
    def show
        @prefecture = Prefecture.find(params[:id])
    end
end
