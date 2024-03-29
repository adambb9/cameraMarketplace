class Camera < ApplicationRecord
  CATEGORIES = ["Video Camera HD", "Video Camera 4K", "Video Camera Tape", "Professional Video & Cinema Cameras", "Action Cams", "Analog", "DSLR", "Mirrorless", "Drones", "Polaroid & Instant", "Trail & Wildlife Cameras", "Waterproof"]
  CONDITIONS = ["brand new", "slightly used", "used", "slight cosmetic damage", "bad cosmetic damage", "in need of repair", "non-functional" ]
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many_attached :photos

  validates :category, :make, :model, presence: true
  validates :category, inclusion: { in: CATEGORIES }
  validates :condition, inclusion: { in: CONDITIONS }
  validates :price, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 100_000 }
  validates :year, numericality: { only_integer: true }

  include PgSearch::Model

  pg_search_scope :search_by_category_make_model_price_and_condition,
    against: [ :category, :make, :model, :price, :condition ],
    using: {
      tsearch: { prefix: true }
    }
end
