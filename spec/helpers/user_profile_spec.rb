# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UserProfileHelper, type: :helper do
  describe 'user_profile_initials' do
    context 'when profile has first_name and last_name' do
      profile = Profile.create(first_name: 'Cliff', last_name: 'Burton')

      it 'returns initials if user_signed_in' do
        signed_in = true
        result = user_profile_initials(signed_in, profile)
        expect(result).to eq 'CB'
      end

      it 'returns MA if !user_signed_in' do
        signed_in = false
        result = user_profile_initials(signed_in, profile)
        expect(result).to eq 'MA'
      end
    end

    context 'when user_signed_in' do
      signed_in = true

      it 'returns MA if profile has only first_name' do
        profile = Profile.create(first_name: 'Cliff')
        result = user_profile_initials(signed_in, profile)
        expect(result).to eq 'MA'
      end

      it 'returns MA if profile has only last_name' do
        profile = Profile.create(last_name: 'Burton')
        result = user_profile_initials(signed_in, profile)
        expect(result).to eq 'MA'
      end
    end
  end

  describe 'user_profile_full_name' do
    context 'when profile has first_name and last_name' do
      profile = Profile.create(first_name: 'Cliff', last_name: 'Burton')

      it 'returns full name if user_signed_in' do
        signed_in = true
        result = user_profile_full_name(signed_in, profile)
        expect(result).to eq 'Cliff Burton'
      end

      it 'returns empty string if !user_signed_in' do
        signed_in = false
        result = user_profile_full_name(signed_in, profile)
        expect(result).to eq ''
      end
    end

    context 'when user_signed_in' do
      signed_in = true

      it 'returns empty string if profile has only first_name' do
        profile = Profile.create(first_name: 'Cliff')
        result = user_profile_full_name(signed_in, profile)
        expect(result).to eq ''
      end

      it 'returns MA if profile has only last_name' do
        profile = Profile.create(last_name: 'Burton')
        result = user_profile_full_name(signed_in, profile)
        expect(result).to eq ''
      end
    end
  end
end
