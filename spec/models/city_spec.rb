# frozen_string_literal: true

require 'rails_helper'

RSpec.describe City, type: :model do
  it { should belong_to :prefecture }
  it { should have_many(:rule_days).dependent(:destroy) }

  describe 'validations' do
    subject { FactoryBot.build(:city) }
    it { should validate_presence_of(:prefecture) }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:rating) }
    it { should validate_numericality_of(:rating).is_greater_than_or_equal_to(0) }
    it { should validate_numericality_of(:rating).is_less_than_or_equal_to(5) }
  end
end
