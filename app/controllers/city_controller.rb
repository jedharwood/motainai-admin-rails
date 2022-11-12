# frozen_string_literal: true

class CityController < ApplicationController
  def index
    @cities = City.all.order(:name)
  end

  def show
    @city = City.find(params[:id])
    @waste_types = WasteType.where(city_identifier: @city.id)
  end

  def new
    @prefectures = Prefecture.all.order(:code)
    @city = City.new
    return unless params[:format].present?

    @city.prefecture_id = params[:format]
  end

  def create
    @prefectures = Prefecture.all.order(:code)
    @city = City.new(params.require(:city).permit(:name, :prefecture_id))
    @city.rating = 0

    respond_to do |format|
      format.html do
        if @city.save
          flash[:success] = 'City saved successfully'
          redirect_to city_index_path
        else
          flash.now[:error] = 'Error: City could not be saved'
          render :new, locals: { city: @city }, status: :unprocessable_entity
        end
      end
    end
  end

  def edit
    @prefectures = Prefecture.all.order(:code)
    @city = City.find(params[:id])
    respond_to do |format|
      format.html { render :edit, locals: { city: @city } }
    end
  end

  def update
    @prefectures = Prefecture.all.order(:code)
    @city = City.find(params[:id])

    respond_to do |format|
      format.html do
        if @city.update(params.require(:city).permit(:name, :prefecture_id, :rating))
          flash[:success] = 'City updated successfully'
          redirect_to city_path(@city)
        else
          flash.now[:error] = 'Error: City could not be updated'
          render :edit, locals: { city: @city }, status: :unprocessable_entity
        end
      end
    end
  end

  def destroy
    @city = City.find(params[:id])
    @city.destroy

    respond_to do |format|
      format.html do
        flash[:success] = 'City removed successfully'
        redirect_to city_index_path
      end
    end
  end
end
