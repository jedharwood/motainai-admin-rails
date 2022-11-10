# frozen_string_literal: true

class RuleDay < ApplicationRecord
  validates :name, presence: true

  belongs_to :city
end
