# frozen_string_literal: true

require 'rails_helper'

signed_in = true
not_signed_in = false
profile_with_full_name = Profile.create(first_name: 'Cliff', last_name: 'Burton', approved: true)
profile_with_first_name = Profile.create(first_name: 'Cliff', approved: false)
profile_with_last_name = Profile.create(last_name: 'Burton')

RSpec.describe UserProfileHelper, type: :helper do
  describe 'approved_user?' do
    it 'returns false if !user_signed_in' do
      result = approved_user?(not_signed_in, profile_with_full_name)
      expect(result).to be false
    end

    it 'returns false if user_signed_in and profile not approved' do
      result = approved_user?(signed_in, profile_with_first_name)
      expect(result).to be false
    end

    it 'returns true if user_signed_in and profile approved' do
      result = approved_user?(signed_in, profile_with_full_name)
      expect(result).to be true
    end
  end
end

RSpec.describe UserProfileHelper, type: :helper do
  describe 'user_profile_initials' do
    it 'returns MA if !user_signed_in' do
      result = user_profile_initials(not_signed_in, profile_with_full_name)
      expect(result).to eq 'MA'
    end

    it 'returns MA if user_signed_in and profile has only first_name' do
      result = user_profile_initials(signed_in, profile_with_first_name)
      expect(result).to eq 'MA'
    end

    it 'returns MA if user_signed_in and profile has only last_name' do
      result = user_profile_initials(signed_in, profile_with_last_name)
      expect(result).to eq 'MA'
    end

    it 'returns initials if user_signed_in and profile has first_name and last_name' do
      result = user_profile_initials(signed_in, profile_with_full_name)
      expect(result).to eq 'CB'
    end
  end
end

RSpec.describe UserProfileHelper, type: :helper do
  describe 'user_profile_full_name' do
    it 'returns empty string if !user_signed_in' do
      result = user_profile_full_name(not_signed_in, profile_with_full_name)
      expect(result).to eq ''
    end

    it 'returns empty string if user_signed_in and profile has only first_name' do
      result = user_profile_full_name(signed_in, profile_with_first_name)
      expect(result).to eq ''
    end

    it 'returns empty string if user_signed_in and profile has only last_name' do
      result = user_profile_full_name(signed_in, profile_with_last_name)
      expect(result).to eq ''
    end

    it 'returns full name if user_signed_in and profile has first_name and last_name' do
      result = user_profile_full_name(signed_in, profile_with_full_name)
      expect(result).to eq 'Cliff Burton'
    end
  end
end
