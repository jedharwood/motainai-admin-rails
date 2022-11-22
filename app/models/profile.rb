# frozen_string_literal: true

class Profile < ApplicationRecord
  validates :first_name, presence: true, on: :update
  validates :last_name, presence: true, on: :update

  belongs_to :user
end
