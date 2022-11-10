class WasteType < ApplicationRecord
  validates :name, presence: true

  belongs_to :rule_day
end
