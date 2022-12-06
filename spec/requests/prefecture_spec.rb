# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Prefecture', type: :request do
  before(:example, populate_cities_for_first_prefecture: true) do
    @prefectures = instantiate_prefecture_list(2)
    @cities = instantiate_city_list(3, @prefectures[0])
  end

  before(:example, populate_cities_for_second_prefecture: true) do
    @prefectures = instantiate_prefecture_list(2)
    @cities = instantiate_city_list(3, @prefectures[1])
  end

  describe 'GET /show' do
    context 'when prefecture has cities', populate_cities_for_first_prefecture: true do
      it 'succeeds' do
        get prefecture_path(@prefectures[0])
        expect(response).to be_successful
        expect(response).to render_template(:show)
      end

      it 'assigns @prefecture' do
        get prefecture_path(@prefectures[0])
        expect(assigns(:prefecture)).to eq(@prefectures[0])
      end

      it 'assigns @cities' do
        get prefecture_path(@prefectures[0])
        expect(assigns(:cities)).to eq(@cities)
      end

      it 'renders show template' do
        get prefecture_path(@prefectures[0])
        expect(response).to render_template(:show)
      end
    end

    context 'when prefecture has no cities', populate_cities_for_second_prefecture: true do
      it 'assigns @cities as an empty array' do
        get prefecture_path(@prefectures[0])
        expect(assigns(:cities)).to eq([])
      end
    end
  end
end
