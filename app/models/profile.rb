# frozen_string_literal: true

class Profile < ApplicationRecord
  validates :first_name, presence: true, on: :update
  validates :last_name, presence: true, on: :update

  belongs_to :user

  before_update :capitalize_names

  private

  def capitalize_names
    self.first_name = first_name.capitalize
    self.last_name = last_name.capitalize
  end
end
