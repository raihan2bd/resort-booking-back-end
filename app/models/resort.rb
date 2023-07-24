class Resort < ApplicationRecord

  # Validations
  validates :name, presence: true
  validates :location, presence: true
  validates :description, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :guests_amount, presence: true, numericality: { greater_than: 0 }
  validates :image_url, presence: true

  # Associations
  belongs_to :user
  has_many :bookings, dependent: :destroy
end