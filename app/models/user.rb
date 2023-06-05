class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :cameras, dependent: :destroy
  has_many :accessories, dependent: :destroy
  has_many :send_bookings, class_name: "Booking", dependent: :destroy
  has_many :recieved_bookings, through: :cameras, source: :bookings

  # messaging
  # has_many :sent_messages, foreign_key: :sender_id, class_name: 'Message'
  # has_many :received_messages, foreign_key: :receiver_id, class_name: 'Message'

  belongs_to :sender, class_name: 'User'
  belongs_to :receiver, class_name: 'User'
  has_many :messages, foreign_key: :sender_id
  has_many :received_messages, foreign_key: :receiver_id, class_name: 'Message'
end

# add accessory to booking
