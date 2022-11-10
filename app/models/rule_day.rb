# frozen_string_literal: true

class RuleDay < ApplicationRecord
  validates :code, presence: true
  validates :name, presence: true

  belongs_to :city
end
