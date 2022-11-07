module PrefectureHelper
  def get_number_of_cities_by_prefecture_id(params)
    City.where(prefecture_id: params[:id]).count
  end
end
