# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'WasteTypes', type: :request do
  describe 'GET /show' do
    # pending "add some examples (or delete) #{__FILE__}"
  end

  describe 'GET /new' do
    let(:city) { create(:city) }
    it 'succeeds' do
      get new_waste_type_path(city)
      expect(response).to be_successful
      expect(response).to render_template(:new)
    end
  end
end
