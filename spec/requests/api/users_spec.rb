# frozen_string_literal: true

require 'rails_helper'

# May this route as controller/method has been superceded
RSpec.describe 'Api::Users', type: :request do
  describe 'Get show' do
    let(:headers) do
      { 'ACCEPT' => 'application/json' }
    end

    context 'user exists' do
      it 'succeeds' do
        user = create(:user)
        get api_user_path(user), headers: headers
        expect(response).to be_successful
      end
    end

    context 'user does not exist' do
      it 'is not found' do
        get api_user_path(id: 'invalid id'), headers: headers
        expect(response.status).to eq 404
      end
    end
  end
end
