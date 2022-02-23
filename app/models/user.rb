class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :cameras, dependent: :destroy
  has_many :send_bookings, class_name: "Booking", dependent: :destroy
  has_many :recieved_bookings, through: :cameras, source: :bookings
end
