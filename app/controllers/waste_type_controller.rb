# frozen_string_literal: true

class WasteTypeController < ApplicationController
    def new
        @city = City.find_by(id: params[:format])
        @rule_days = RuleDay.where(city_id: params[:format]).order(:code)
        @waste_type = WasteType.new()
        session[:city_id] = params[:format]
    end

    def create
        @city = City.find_by(id: session[:city_id])
        @rule_days = RuleDay.where(city_id: session[:city_id]).order(:code)
        @waste_type = WasteType.new(params.require(:waste_type).permit(:rule_day_id, :name, :description, :instructions, :irregular_frequency))
        @waste_type.city_identifier = session[:city_id]
        
        respond_to do |format|
            format.html do
            if @waste_type.save
                flash[:success] = 'Waste type saved successfully'
                redirect_to city_path(@city)
                session.delete(:city_id)
            else
                flash.now[:error] = 'Error: Waste type could not be saved'
                render :new, locals: { waste_type: @waste_type}, status: :unprocessable_entity
            end
            end
        end
    end
end
