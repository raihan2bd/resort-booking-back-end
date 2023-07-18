class User < ApplicationRecord
  has_many :resorts, dependent: :destroy
  has_many :bookings, dependent: :destroy

  validates :name, presence: true
end
