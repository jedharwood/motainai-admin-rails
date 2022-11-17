# frozen_string_literal: true

require 'rails_helper'

RSpec.describe WasteType, type: :model do
  it { should belong_to :rule_day }

  describe 'validations' do
    subject { FactoryBot.build(:waste_type) }
    it { should validate_presence_of(:rule_day) }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:city_identifier) }
  end
end
