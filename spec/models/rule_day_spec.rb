# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RuleDay, type: :model do
  it { should belong_to :city }
  it { should have_many(:waste_types).dependent(:destroy) }

  describe 'validations' do
    subject { FactoryBot.build(:rule_day) }
    it { should validate_presence_of(:city) }
    it { should validate_presence_of(:code) }
    it { should validate_presence_of(:name) }
  end
end
