# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Cities', type: :request do
  let(:city_list) { create_list(:city, 3) }
  let(:prefecture_list) { create_list(:prefecture, 3) }

  before(:example, clear_city_list: true) do
    city_list = []
  end

  before(:example, fill_in_new_city_form: true) do
    @new_city_params = { name: 'New City', prefecture_id: prefecture_list[0].id }
  end

  before(:example, fill_in_new_city_form_badly: true) do
    @invalid_new_city_params = { name: 'Invalid New City', prefecture_id: 1 }
  end

  describe 'GET /index' do
    it 'succeeds' do
      get city_index_path
      expect(response).to be_successful
      expect(response.status).to eq(200)
    end

    it 'assigns @cities' do
      expected = city_list.sort_by { |city| city.name }
      get city_index_path
      expect(assigns(:cities)).to eq(expected)
    end

    it 'renders index template' do
      get city_index_path
      expect(response).to render_template(:index)
    end

    context 'if there are no cities in the db', clear_city_list: true do
      it 'succeeds' do
        get city_index_path
        expect(response).to be_successful
        expect(response.status).to eq(200)
      end

      it 'assigns @cities as an empty array' do
        get city_index_path
        expect(assigns(:cities)).to eq([])
      end

      it 'renders index template' do
        get city_index_path
        expect(response).to render_template(:index)
      end
    end
  end

  describe 'GET /show' do
    it 'succeeds' do
      get city_path(city_list[0])
      expect(response).to be_successful
      expect(response.status).to eq(200)
    end

    it 'assigns @city' do
      get city_path(city_list[0])
      expect(assigns(:city)).to eq(city_list[0])
    end

    it 'renders show template' do
      get city_path(city_list[0])
      expect(response).to render_template(:show)
    end
  end

  describe 'GET /new' do
    context 'when no prefecture is pre-selected' do
      it 'succeeds' do
        get new_city_path
        expect(response).to be_successful
        expect(response.status).to eq(200)
      end

      it 'assigns @prefectures' do
        expected = prefecture_list.sort_by { |prefecture| prefecture.code }
        get new_city_path
        expect(assigns(:prefectures)).to eq(expected)
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

    context 'when prefecture is pre-selected' do
      it 'succeeds' do
        get new_city_path(prefecture_list[0])
        expect(response).to be_successful
        expect(response.status).to eq(200)
      end

      it 'assigns @prefectures' do
        expected = prefecture_list.sort_by { |prefecture| prefecture.code }
        get new_city_path
        expect(assigns(:prefectures)).to eq(expected)
      end

      it 'assigns a new @city with pre-selected prefecture_id' do
        get new_city_path(prefecture_list[0])
        expected_city = assigns(:city)
        expect(expected_city.prefecture_id).to eq(prefecture_list[0].id)
        expect(expected_city).to be_a_new(City)
      end

      it 'renders new template' do
        get new_city_path(prefecture_list[0])
        expect(response).to render_template(:new)
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
        expected = prefecture_list.sort_by { |prefecture| prefecture.code }
        post city_new_path, params: { city: @new_city_params }
        expect(assigns(:prefectures)).to eq(expected)
      end
  
      it 'assigns @city with a rating of zero' do
        post city_new_path, params: { city: @new_city_params }
        expected_city = assigns(:city)
        expect(expected_city.name).to eq(@new_city_params[:name])
        expect(expected_city.prefecture_id).to eq(prefecture_list[0].id)
        expect(expected_city.rating).to eq(0)
      end
  
      it 'increases City count by 1' do
        expect{
          post city_new_path, params: { city: @new_city_params }
        }.to change(City,:count).by(1)
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

    context 'when unsuccessful', fill_in_new_city_form_badly: true do
      it 'returns status: unprocessable_entity' do
        post city_new_path, params: { city: @invalid_new_city_params }
        expect(response.media_type).to eq('text/html')
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.status).to eq(422)
      end
  
      it 'assigns @prefectures' do
        expected = prefecture_list.sort_by { |prefecture| prefecture.code }
        post city_new_path, params: { city: @invalid_new_city_params }
        expect(assigns(:prefectures)).to eq(expected)
      end
  
      it 'does not increase City count' do
        expect{
          post city_new_path, params: { city: @invalid_new_city_params }
        }.to change(City,:count).by(0)
      end
  
      it 'shows an error message' do
        post city_new_path, params: { city: @invalid_new_city_params }
        expect(flash[:error]).to eq('Error: City could not be saved')
      end
  
      it 'renders new template' do
        post city_new_path, params: { city: @invalid_new_city_params }
        expect(response).to render_template(:new)
      end  
    end
  end
end
