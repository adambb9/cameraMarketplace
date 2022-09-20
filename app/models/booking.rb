class Booking < ApplicationRecord
  STATUS = ["Accepted", "Pending", "Rejected"]
  belongs_to :camera
  # belongs_to :accessory
  # belongs_to :lense

  belongs_to :user

  validates :comment, length: { minimum: 6 }
  validates :status, inclusion: { in: STATUS }
  validates :bid, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 100_000 }
  validates :camera_id, uniqueness: { scope: :user_id, message: "is already selected" }
end

# add accessory_id to bookings schema
# add accessory_id ito controller
# validates :accessory_id, uniqueness: { scope: :user_id, message: "is already selected" }
# validates :lense_id, uniqueness: { scope: :user_id, message: "is already selected" }
