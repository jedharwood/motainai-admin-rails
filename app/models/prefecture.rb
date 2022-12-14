# frozen_string_literal: true

class Prefecture < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :code, presence: true, uniqueness: true

  has_many :cities, dependent: :destroy
end
