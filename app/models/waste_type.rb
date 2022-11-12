# frozen_string_literal: true

class WasteType < ApplicationRecord
  validates :name, presence: true
  validates :city_identifier, presence: true

  belongs_to :rule_day
end
