require 'rails_helper'

RSpec.describe City, type: :model do
  it { should belong_to :prefecture }

  describe "validations" do
    subject { FactoryBot.build(:city) }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:rating) }
  end
end
