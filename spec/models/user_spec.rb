require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_one(:profile).dependent(:destroy) }

  context 'on creating' do
    user = User.create(email: 'test@user.com', password: 'testpassword')

    it 'should have correct username and password' do
      expect(user.email).to eq 'test@user.com'
      expect(user.password).to eq 'testpassword'
    end
  end
end
