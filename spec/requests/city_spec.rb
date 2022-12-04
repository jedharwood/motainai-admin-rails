# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Cities', type: :request do
  before(:example, populate_prefecture_and_cities: true) do
    @prefectures = instantiate_prefecture_list(1)
    @cities = instantiate_city_list(3, @prefectures[0])
  end

  before(:example, populate_prefectures_and_cities: true) do
    @prefectures = instantiate_prefecture_list(3)
    @cities = instantiate_city_list(3, @prefectures[0])
  end

  before(:example, populate_waste_types_for_selected_city: true) do
    @prefectures = instantiate_prefecture_list(1)
    @cities = instantiate_city_list(2, @prefectures[0])
    @waste_types = instantiate_waste_types(3, @cities[0])
  end

  before(:example, populate_waste_types_for_other_city: true) do
    @prefectures = instantiate_prefecture_list(1)
    @cities = instantiate_city_list(2, @prefectures[0])
    @waste_types = instantiate_waste_types(3, @cities[1])
  end

  before(:example, fill_in_new_city_form: true) do
    @prefectures = instantiate_prefecture_list(3)
    @new_city_params = { name: 'New city name', prefecture_id: @prefectures[0].id }
  end

  before(:example, fill_in_form_badly: true) do
    @prefectures = instantiate_prefecture_list(1)
    @cities = instantiate_city_list(2, @prefectures[0])
    @invalid_city_params = { name: 'Invalid city name', prefecture_id: 1 }
  end

  before(:example, edit_city_form: true) do
    @prefectures = instantiate_prefecture_list(3)
    @cities = instantiate_city_list(2, @prefectures[0])
    @edited_city_params = { name: 'Edited city name', prefecture_id: @prefectures[2].id, rating: 5 }
  end

  describe 'GET /index' do
    context 'when db contains cities', populate_prefecture_and_cities: true do
      it 'succeeds' do
        get city_index_path
        expect(response).to be_successful
        expect(response.status).to eq(200)
      end
  
      it 'assigns @cities' do
        get city_index_path
        expect(assigns(:cities)).to eq(@cities)
      end
  
      it 'renders index template' do
        get city_index_path
        expect(response).to render_template(:index)
      end
    end
    
    context 'when db contains no cities' do
      it 'assigns @cities as an empty array' do
        get city_index_path
        expect(assigns(:cities)).to eq([])
      end
    end
  end

  describe 'GET /show' do
    context 'when city has waste types', populate_waste_types_for_selected_city: true do
      it 'succeeds' do
        get city_path(@cities[0])
        expect(response).to be_successful
        expect(response.status).to eq(200)
      end
  
      it 'assigns @city' do
        get city_path(@cities[0])
        expect(assigns(:city)).to eq(@cities[0])
      end

      it 'assigns @waste_types' do  
        get city_path(@cities[0])
        expect(assigns(:waste_types)).to eq(@waste_types)
      end
  
      it 'renders show template' do
        get city_path(@cities[0])
        expect(response).to render_template(:show)
      end
    end

    context 'when city has no waste types', populate_waste_types_for_other_city: true do
      it 'does not assign @waste_types' do  
        get city_path(@cities[0])
        expect(assigns(:waste_types)).to eq([])
      end
    end    
  end

  describe 'GET /new' do
    context 'when no prefecture is pre-selected', populate_prefectures_and_cities: true do
      it 'succeeds' do
        get new_city_path
        expect(response).to be_successful
        expect(response.status).to eq(200)
      end

      it 'assigns @prefectures' do
        get new_city_path
        expect(assigns(:prefectures)).to eq(@prefectures)
      end

      it 'assigns a new @city with no prefecture_id' do
        get new_city_path
        expected_city = assigns(:city)
        expect(expected_city.prefecture_id).to eq(nil)
        expect(expected_city).to be_a_new(City)
      end

      it 'renders new template' do
        get new_city_path
        expect(response).to render_template(:new)
      end
    end

    context 'when prefecture is pre-selected', populate_prefectures_and_cities: true do
      it 'assigns a new @city with pre-selected prefecture_id' do
        get new_city_path(@prefectures[0])
        expected_city = assigns(:city)
        expect(expected_city.prefecture_id).to eq(@prefectures[0].id)
        expect(expected_city).to be_a_new(City)
      end
    end
  end

  describe 'POST /create' do
    context 'when successful', fill_in_new_city_form: true do
      it 'returns status: found' do
        post city_new_path, params: { city: @new_city_params }
        expect(response.media_type).to eq('text/html')
        expect(response).to have_http_status(:found)
        expect(response.status).to eq(302)
      end

      it 'assigns @prefectures' do
        post city_new_path, params: { city: @new_city_params }
        expect(assigns(:prefectures)).to eq(@prefectures)
      end

      it 'assigns @city with a rating of zero' do
        post city_new_path, params: { city: @new_city_params }
        expected_city = assigns(:city)
        expect(expected_city.name).to eq(@new_city_params[:name])
        expect(expected_city.prefecture_id).to eq(@new_city_params[:prefecture_id])
        expect(expected_city.rating).to eq(0)
      end

      it 'increases City count by 1' do
        expect do
          post city_new_path, params: { city: @new_city_params }
        end.to change(City, :count).by(1)
      end

      it 'shows a success message' do
        post city_new_path, params: { city: @new_city_params }
        expect(flash[:success]).to eq('City saved successfully')
      end

      it 'redirects to city_index_path' do
        post city_new_path, params: { city: @new_city_params }
        expect(response).to redirect_to(city_index_path)
      end
    end

    context 'when unsuccessful', fill_in_form_badly: true do
      it 'returns status: unprocessable_entity' do
        post city_new_path, params: { city: @invalid_city_params }
        expect(response.media_type).to eq('text/html')
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.status).to eq(422)
      end

      it 'does not increase City count' do
        expect do
          post city_new_path, params: { city: @invalid_city_params }
        end.to change(City, :count).by(0)
      end

      it 'shows an error message' do
        post city_new_path, params: { city: @invalid_city_params }
        expect(flash[:error]).to eq('Error: City could not be saved')
      end

      it 'renders new template' do
        post city_new_path, params: { city: @invalid_city_params }
        expect(response).to render_template(:new)
      end
    end
  end

  describe 'GET /edit' do
    context 'when db contains cities', populate_prefectures_and_cities: true do
      it 'succeeds' do
        get edit_city_path(@cities[0])
        expect(response).to be_successful
        expect(response.status).to eq(200)
      end
  
      it 'assigns @prefectures' do
        get edit_city_path(@cities[0])
        expect(assigns(:prefectures)).to eq(@prefectures)
      end
  
      it 'assigns @city' do
        get edit_city_path(@cities[0])
        expect(assigns(:city)).to eq(@cities[0])
      end
  
      it 'renders edit template' do
        get edit_city_path(@cities[0])
        expect(response).to render_template(:edit)
      end
    end
  end

  describe 'PATCH /update' do
    context 'when successful', edit_city_form: true do
      it 'returns status: found' do
        patch edit_city_path(@cities[0]), params: { city: @edited_city_params }
        expect(response.media_type).to eq('text/html')
        expect(response).to have_http_status(:found)
        expect(response.status).to eq(302)
      end

      it 'assigns @prefectures' do
        patch edit_city_path(@cities[0]), params: { city: @edited_city_params }
        expect(assigns(:prefectures)).to eq(@prefectures)
      end

      it 'assigns @city with edited parameters' do
        patch edit_city_path(@cities[0]), params: { city: @edited_city_params }
        expected_city = assigns(:city)
        expect(expected_city.name).to eq(@edited_city_params[:name])
        expect(expected_city.prefecture_id).to eq(@edited_city_params[:prefecture_id])
        expect(expected_city.rating).to eq(@edited_city_params[:rating])
      end

      it 'updates the city in the db' do
        patch edit_city_path(@cities[0]), params: { city: @edited_city_params }
        updated_city = City.find(@cities[0].id)
        expect(updated_city.name).to eq(@edited_city_params[:name])
        expect(updated_city.prefecture_id).to eq(@edited_city_params[:prefecture_id])
        expect(updated_city.rating).to eq(@edited_city_params[:rating])
      end

      it 'does not increase City count' do
        expect do
          patch edit_city_path(@cities[0]), params: { city: @edited_city_params }
        end.to change(City, :count).by(0)
      end

      it 'shows a success message' do
        patch edit_city_path(@cities[0]), params: { city: @edited_city_params }
        expect(flash[:success]).to eq('City updated successfully')
      end

      it 'redirects to city_path' do
        patch edit_city_path(@cities[0]), params: { city: @edited_city_params }
        expect(response).to redirect_to(city_path(@cities[0]))
      end
    end

    context 'when unsuccessful', fill_in_form_badly: true do
      it 'returns status: unprocessable_entity' do
        patch edit_city_path(@cities[0]), params: { city: @invalid_city_params }
        expect(response.media_type).to eq('text/html')
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.status).to eq(422)
      end

      it 'does not increase City count' do
        expect do
          patch edit_city_path(@cities[0]), params: { city: @invalid_city_params }
        end.to change(City, :count).by(0)
      end

      it 'shows an error message' do
        patch edit_city_path(@cities[0]), params: { city: @invalid_city_params }
        expect(flash[:error]).to eq('Error: City could not be updated')
      end

      it 'renders edit template' do
        patch edit_city_path(@cities[0]), params: { city: @invalid_city_params }
        expect(response).to render_template(:edit)
      end
    end
  end

  describe 'DELETE /destroy' do
    context 'when db contains cities', populate_prefecture_and_cities: true do
      it 'returns status: found' do
        delete city_path(@cities[0])
        expect(response.media_type).to eq('text/html')
        expect(response).to have_http_status(:found)
        expect(response.status).to eq(302)
      end

      it 'assigns @city' do
        delete city_path(@cities[0])
        expect(assigns(:city)).to eq(@cities[0])
      end
      
      it 'decreases City count by 1' do
        expect do
          delete city_path(@cities[0])
        end.to change(City, :count).by(-1)
      end
  
      it 'shows a success message' do
        delete city_path(@cities[0])
        expect(flash[:success]).to eq('City removed successfully')
      end
  
      it 'redirects to city_index_path' do
        delete city_path(@cities[0])
        expect(response).to redirect_to(city_index_path)
      end
    end
  end
end

def instantiate_prefecture_list(number_of_prefectures)
  @prefectures = []
  (0...number_of_prefectures).each { |i|
    idx = i + 1
    @prefectures << Prefecture.create(name: "Test prefecture #{idx}", code: 900 + idx)
  }
  @prefectures.sort_by { |prefecture| prefecture.code }
end

def instantiate_city_list(number_of_cities, prefecture)
  @cities = []
  (0...number_of_cities).each { |i|
    idx = i + 1
    @cities << City.create(name: "Test city #{idx}", rating: 0, prefecture: prefecture)
  }
  @cities.sort_by { |city| city.name }
end

def instantiate_waste_types(number_of_waste_types, city)
  @waste_types = []
  (0...number_of_waste_types).each { |i|
    idx = i + 1
    @waste_types << WasteType.create!(name: "Waste type #{idx}", city_identifier: city.id, rule_day: RuleDay.create!(name: "Rule day #{idx}", code: idx, city: city))
  }
  @waste_types.sort_by { |waste_type| waste_type.rule_day.code }
end

    