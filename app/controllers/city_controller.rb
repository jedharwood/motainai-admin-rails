# frozen_string_literal: true

class CityController < ApplicationController
    def index
        @cities = City.all.order(:name)
    end

    def show
        @city = City.find(params[:id])
    end

    def new
        @new_city = City.new
        @prefectures = Prefecture.all.order(:code)
    end

    def create
        @new_city = City.new(params.require(:city).permit(:name, :prefecture_id))
        @new_city.rating = 0
        @prefectures = Prefecture.all.order(:code)

        respond_to do |format|
            format.html do
                if @new_city.save
                    flash[:success] = "City saved successfully"
                    redirect_to city_index_path 
                else
                    flash.now[:error] = "Error: City could not be saved"
                    render :new, locals: { city: @new_city }, status: :unprocessable_entity
                end
            end
        end
    end
end
