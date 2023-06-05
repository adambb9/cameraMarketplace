class Message < ApplicationRecord
  belongs_to :productable, polymorphic: true

  belongs_to :sender, class_name: 'User'
  belongs_to :receiver, class_name: 'User'
  # belongs_to :product, optional: true
  has_rich_text :content

  scope :between, -> (sender, receiver) do
    where(sender: sender, receiver: receiver).or(
      where(sender: receiver, receiver: sender)
    )
  end
end
