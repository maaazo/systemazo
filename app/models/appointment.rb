class Appointment < ApplicationRecord
  belongs_to :user
  belongs_to :company

  validate :appointment_time_in_future

  private

  def appointment_time_in_future
    if appointment_time.present? && appointment_time <= Time.now
      errors.add(:appointment_time, "must be in the future")
    end
  end
end
