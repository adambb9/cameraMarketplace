class Camera < ApplicationRecord
  CATEGORIES = ["DSLR", "Mirrorless", "Video Camera Tape", "Video Camera HD", "Action Cams", "Drones", "Analog", "360 degrees", "Waterproof", "Instant", "Handy Cam" ]
  CONDITIONS = ["brand new", "slightly used", "used", "slight cosmetic damage", "bad cosmetic damage", "in need of repair", "non-functional" ]
  belongs_to :user

  validates :category, :make, :model, presence: true
  validates :category, inclusion: { in: CATEGORIES }
  validates :condition, inclusion: { in: CONDITIONS }
  validates :price, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 100_000 }
  validates :year, numericality: { only_integer: true }
end
