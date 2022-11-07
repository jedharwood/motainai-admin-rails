require 'rails_helper'

RSpec.describe 'Api::UserByEmail', type: :request do
  describe 'Get show' do
    let(:headers) do
      { 'ACCEPT' => 'application/json' }
    end

    context 'user exists' do
      it 'succeeds' do
        user = create(:user)
        get api_user_by_email_path, params: { email: user.email }, headers: headers
        expect(response).to be_successful
      end
    end

    context 'user does not exist' do
      it 'is not found' do
        get api_user_by_email_path, params: { email: 'invalid_email@notfound.com' }, headers: headers
        expect(response.status).to eq 404
      end
    end
  end
end
