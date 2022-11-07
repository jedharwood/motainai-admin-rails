require 'rails_helper'

RSpec.describe 'Prefecture', type: :request do
  describe 'GET /show' do
    let(:prefecture) { create(:prefecture) }
    it 'succeeds' do
      get prefecture_path(prefecture)
      expect(response).to be_successful
    end
  end
end
