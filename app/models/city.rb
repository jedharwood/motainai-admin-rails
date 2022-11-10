# frozen_string_literal: true

class City < ApplicationRecord
  validates :name, presence: true
  validates :rating, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 5 }
  validates :prefecture, presence: true

  has_many :rule_days, dependent: :destroy

  belongs_to :prefecture

  after_create :create_rule_days
  def create_rule_days
    ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"].each do |day_name|
      self.rule_days << RuleDay.create(name: day_name)
      save!
    end
  end
end
