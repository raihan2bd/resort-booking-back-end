class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher

  devise :database_authenticatable, :registerable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: self

  # Validations
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true
  validates :role, inclusion: { in: %w[member admin] }

  # Associations
  has_many :resorts, dependent: :destroy
  has_many :bookings, dependent: :destroy
end