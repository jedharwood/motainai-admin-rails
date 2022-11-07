# frozen_string_literal: true

class City < ApplicationRecord
  validates :name, presence: true
  validates :rating, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 5 }
  validates :prefecture, presence: true

  belongs_to :prefecture
end
