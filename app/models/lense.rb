class Lense < ApplicationRecord
  CATEGORIES = ["Video Camera HD", "Video Camera 4K", "Video Camera Tape", "Professional Video & Cinema Cameras", "Action Cams", "Analog", "DSLR", "Mirrorless", "Waterproof", "Polaroid & Instant", "Drones", "Trail & Wildlife Cameras", "Smartphones", "Other"]
  CONDITIONS = ["brand new", "slightly used", "used", "slight cosmetic damage", "bad cosmetic damage", "in need of repair", "parts/non-functional" ]
  LENS_TYPES = ["Standard", "Wide Angle", "Fisheye", "Long Lens & Telephoto", "Zoom", "Macro", "Adapter", "Other" ]
  LENS_MOUNTS = ["Thread", "Quick mount", "Bayonet mount", "Canon EOS lenses", "Micro Four Thirds mount", "A-Mount", "E-Mount", "EF-Mount", "PL-Mount", "F-Mount", "G-Mount", "T-Mount", "RF-Mount", "L-Mount", "M39-Mount", "M42-Mount", "M43-Mount", "X-Mount", "Z-Mount", "Magnetic", "Clip on", "Other" ]
  DIAMETERS = [0.0, 25.0, 27.0, 28.0, 30.0, 30.5, 37.0, 39.0, 40.0, 40.5, 43.0, 46.0, 49.0, 52.0, 55.0, 58.0, 60.0, 62.0, 67.0, 72.0, 77.0, 82.0, 86.0, 95.0, 102.0, 105.0]
  belongs_to :user
  # has_many :bookings, dependent: :destroy
  has_many_attached :photos

  validates :category, :condition, :make, :lens_type, :lens_mount, :diameter, presence: true
  validates :category, inclusion: { in: CATEGORIES }
  validates :condition, inclusion: { in: CONDITIONS }
  validates :lens_type, inclusion: { in: LENS_TYPES }
  validates :diameter, inclusion: { in: 0..106 }
  validates :lens_mount, inclusion: { in: LENS_MOUNTS }
  validates :price, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 100_000 }
  validates :description, length: { minimum: 50 }

  include PgSearch::Model
  pg_search_scope :search_by_category_make_lens_type_diameter_lens_mount_price_and_condition,
    against: [ :category, :make, :lens_type, :diameter, :lens_mount, :price, :condition ],
    using: {
      tsearch: { prefix: true }
    }
end
