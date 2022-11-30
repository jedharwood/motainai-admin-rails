# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Cities', type: :request do
  describe 'GET /index' do
    let(:city_list) { create_list(:city, 3) } 
      
    it 'succeeds' do
      get city_index_path
      expect(response).to be_successful
      expect(response.status).to eq(200)
      expect(response).to render_template(:index)
    end

    it 'renders index template' do
      get city_index_path
      expect(response).to render_template(:index)
    end

    it "assigns @cities" do
      get city_index_path
      expected = city_list.sort_by { |city| city.name } 
      expect(assigns(:cities)).to eq(expected)
    end
  end

  describe 'GET /show' do
    let(:city) { create(:city) }
    
    it 'succeeds' do
      get city_path(city)
      expect(response).to be_successful
      expect(response).to render_template(:show)
    end
  end

  describe 'GET /new' do
    let(:city) { create(:city) }
    let(:prefecture) { create(:prefecture) }
    it 'succeeds' do
      get new_city_path
      expect(response).to be_successful
      expect(response).to render_template(:new)
    end

    it 'succeeds when passed a prefecture' do
      get new_city_path(prefecture)
      expect(response).to be_successful
      expect(response).to render_template(:new)
      # Assert that response conytains appropriate prefecture
    end
  end
end
