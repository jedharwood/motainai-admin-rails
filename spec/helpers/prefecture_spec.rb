# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PrefectureHelper, type: :helper do
  describe 'get_number_of_cities_by_prefecture_id' do
    let(:prefecture_without_cities) { create(:prefecture) }
    let(:prefecture_with_cities) { create(:prefecture) }

    it 'returns zero if prefecture has no associated cities' do
      result = get_number_of_cities_by_prefecture_id(prefecture_without_cities)
      expect(result).to eq 0
    end

    it 'returns number of cities if prefecture has associated cities' do
      City.create!(prefecture: prefecture_with_cities, name: 'Test City 1', rating: 0)
      City.create(prefecture: prefecture_with_cities, name: 'Test City 2', rating: 0)
      result = get_number_of_cities_by_prefecture_id(prefecture_with_cities)
      expect(result).to eq 2
    end
  end
end

RSpec.describe PrefectureHelper, type: :helper do
  describe 'get_number_of_rules_by_city_id' do
    let(:city_without_rules) { create(:city) }
    let(:city_with_rules) { create(:city) }

    it 'returns zero if city has no associated rules' do
      result = get_number_of_rules_by_city_id(city_without_rules)
      expect(result).to eq 0
    end

    it 'returns number of rules if city has associated rules' do
      rule_day = RuleDay.create!(city_id: city_with_rules.id, name: 'Monday', code: 0)
      WasteType.create!(city_identifier: city_with_rules.id, name: 'Test Waste Type 1', rule_day:)
      WasteType.create!(city_identifier: city_with_rules.id, name: 'Test Waste Type 2', rule_day:)
      result = get_number_of_rules_by_city_id(city_with_rules)
      expect(result).to eq 2
    end
  end
end
