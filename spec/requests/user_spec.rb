# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /index' do
    it 'succeeds' do
      get user_index_path
      expect(response).to be_successful
      expect(response).to render_template(:index)
    end
  end
end
