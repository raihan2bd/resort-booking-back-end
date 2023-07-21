class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher


  devise :database_authenticatable, :registerable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: self

  has_many :resorts, dependent: :destroy
  has_many :bookings, dependent: :destroy

  validates :name, presence: true
end
