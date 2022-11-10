require 'rails_helper'

RSpec.describe WasteType, type: :model do
  it { should belong_to :rule_day }

  describe 'validations' do
    subject { FactoryBot.build(:waste_type) }
    it { should validate_presence_of(:name) }
  end
end
