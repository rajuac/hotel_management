class Allotment < ApplicationRecord
  belongs_to :user
  belongs_to :room
  after_save :change_room_status
  validate :future_checkout_time

  def change_room_status
    if status == 'booked'
      room.update!(is_booked: true)
    else
      room.update!(is_booked: false)
    end
  end

  def future_checkout_time
    if checkin.present? && checkout.present? &&
        checkout <= checkin
        errors.add(:checkout, 'must be a valid time after your check in ' \
        'time.')
    end
  end
end
