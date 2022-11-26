# frozen_string_literal: true

class City < ApplicationRecord
  validates :name, presence: true
  validates :rating, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 5 }
  validates :prefecture, presence: true

  has_many :rule_days, dependent: :destroy

  belongs_to :prefecture

  after_create :create_rule_days

  private

  def create_rule_days
    { 1 => 'Monday', 2 => 'Tuesday', 3 => 'Wednesday', 4 => 'Thursday', 5 => 'Friday', 6 => 'Saturday',
      7 => 'Sunday' }.each do |code, name|
      rule_days << RuleDay.create(code:, name:)
      save!
    end
  end
end
