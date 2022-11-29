# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Profiles', type: :request do
  describe 'GET /show' do
    let(:profile) { create(:profile) }
    it 'succeeds' do
      get profile_path(profile)
      expect(response).to be_successful
      expect(response).to render_template(:show)
    end
  end
end
