class Booking < ApplicationRecord

  # Validations
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :address, presence: true

  # Custom validation to check if the start date is before the end date
  validate :start_date_before_end_date

  # Associations
  belongs_to :user
  belongs_to :resort

  private

  def start_date_before_end_date
    return unless start_date && end_date

    errors.add(:start_date, "must be before the end date") if start_date >= end_date
  end
end