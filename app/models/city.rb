class City < ApplicationRecord
  validates :name, presence: true
  validates :rating, presence: true
  validates :prefecture, presence: true

  belongs_to :prefecture
end
