# frozen_string_literal: true

class HomeController < ApplicationController
    def index
        @prefectures = Prefecture.all
    end
end
