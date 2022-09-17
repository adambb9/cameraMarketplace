class Accessory < ApplicationRecord
  CATEGORIES = ["Lights", "Tripods", "Memory Cards", "Adapters", "Stabilizers", "Chargers", "Batteries","Bags", "Other" ]
  CONDITIONS = ["brand new", "slightly used", "used", "slight cosmetic damage", "bad cosmetic damage", "in need of repair", "non-functional" ]
  belongs_to :user
  # has_many :bookings, dependent: :destroy
  has_many_attached :photos

  validates :category, :make, presence: true
  validates :category, inclusion: { in: CATEGORIES }
  validates :condition, inclusion: { in: CONDITIONS }
  validates :price, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 100_000 }

  include PgSearch::Model
  pg_search_scope :search_by_category_make_price_and_condition,
    against: [ :category, :make, :price, :condition ],
    using: {
      tsearch: { prefix: true }
    }
end
