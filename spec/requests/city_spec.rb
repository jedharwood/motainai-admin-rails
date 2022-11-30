# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Cities', type: :request do
  let(:city_list) { create_list(:city, 3) } 

  before(:example, clear_city_list: true) do
    city_list = []
  end
  
  describe 'GET /index' do
    it 'succeeds' do
      get city_index_path
      expect(response).to be_successful
      expect(response.status).to eq(200)
    end

    it 'renders index template' do
      get city_index_path
      expect(response).to render_template(:index)
    end

    it "assigns @cities" do
      expected = city_list.sort_by { |city| city.name } 
      get city_index_path
      expect(assigns(:cities)).to eq(expected)
    end

    context 'if there are no cities in the db', clear_city_list: true do
      it 'succeeds' do
        get city_index_path
        expect(response).to be_successful
        expect(response.status).to eq(200)
      end
  
      it 'renders index template' do
        get city_index_path
        expect(response).to render_template(:index)
      end
  
      it "assigns @cities as an empty array" do
        get city_index_path
        expect(assigns(:cities)).to eq([])
      end
    end
  end

  describe 'GET /show' do
    it 'succeeds' do
      get city_path(city_list[0])
      expect(response).to be_successful
      expect(response.status).to eq(200)
    end

    it 'renders show template' do
      get city_path(city_list[0])
      expect(response).to render_template(:show)
    end

    it 'assigns @city' do
      get city_path(city_list[0])
      expect(assigns(:city)).to eq(city_list[0])
    end
  end

  describe 'GET /new' do
    let(:prefecture_list) { create_list(:prefecture, 3) } 

    context 'when no prefecture is pre-selected' do
      it 'succeeds' do
        get new_city_path
        expect(response).to be_successful
        expect(response.status).to eq(200)
      end
  
      it 'renders new template' do
        get new_city_path
        expect(response).to render_template(:new)
      end

      it 'assigns @prefectures' do
        expected = prefecture_list.sort_by { |prefecture| prefecture.code } 
        get new_city_path
        expect(assigns(:prefectures)).to eq(expected)
      end

      it 'assigns @city with no prefecture_id' do
        get new_city_path
        expected_city = assigns(:city)
        expect(expected_city.prefecture_id).to eq(nil)
      end
    end

    context 'when prefecture is pre-selected' do
      it 'succeeds' do
        get new_city_path(prefecture_list[0])
        expect(response).to be_successful
        expect(response.status).to eq(200)
      end
  
      it 'renders new template' do
        get new_city_path(prefecture_list[0])
        expect(response).to render_template(:new)
      end

      it 'assigns @prefectures' do
        expected = prefecture_list.sort_by { |prefecture| prefecture.code } 
        get new_city_path
        expect(assigns(:prefectures)).to eq(expected)
      end

      it 'assigns @city with pre-selected prefecture_id' do
        get new_city_path(prefecture_list[0])
        expected_city = assigns(:city)
        expect(expected_city.prefecture_id).to eq(prefecture_list[0].id)
      end
    end
  end
end
