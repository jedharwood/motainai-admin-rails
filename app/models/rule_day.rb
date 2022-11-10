# frozen_string_literal: true

class RuleDay < ApplicationRecord
  validates :code, presence: true
  validates :name, presence: true

  has_many :waste_types, dependent: :destroy

  belongs_to :city
end
