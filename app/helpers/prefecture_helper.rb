# frozen_string_literal: true

module PrefectureHelper
  def get_number_of_cities_by_prefecture_id(params)
    City.where(prefecture_id: params[:id]).count
  end

  def get_number_of_rules_by_city_id(params)
     WasteType.where(city_identifier: params[:id]).count 
  end
end
