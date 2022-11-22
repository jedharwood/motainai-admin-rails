# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Profile, type: :model do
  it { belong_to :user }

  describe 'validations' do
    subject { FactoryBot.build(:profile) }
    it { should validate_presence_of(:first_name).on(:update) }
    it { should validate_presence_of(:last_name).on(:update) }
    it { should_not validate_presence_of(:first_name).on(:create) }
    it { should_not validate_presence_of(:last_name).on(:create) }
  end
end
