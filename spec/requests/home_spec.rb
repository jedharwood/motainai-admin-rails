# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Homes', type: :request do
  before(:example, populate_prefectures: true) do
    @prefectures = instantiate_prefecture_list(3)
  end

  describe 'GET /index' do
    context 'when db contains cities', populate_prefectures: true do
      it 'succeeds' do
        get root_path
        expect(response).to be_successful
        expect(response).to render_template(:index)
      end

      it 'assigns @prefectures' do
        get root_path
        expect(assigns(:prefectures)).to eq(@prefectures)
      end
  
      it 'renders index template' do
        get root_path
        expect(response).to render_template(:index)
      end
    end
  
    context 'when db contains no prefectures' do
      it 'assigns @prefectures as an empty array' do
        get root_path
        expect(assigns(:prefectures)).to eq([])
      end
    end
  end
end
