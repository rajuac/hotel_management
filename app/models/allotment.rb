class Allotment < ApplicationRecord
  belongs_to :user
  belongs_to :room
  after_save :change_room_status
  validate :future_checkin_time, on: :create
  validate :future_checkout_time, on: :create

  def change_room_status
    room_status = (status == 'booked')
    room.update!(is_booked: room_status)
  end

  def future_checkin_time
    errors.add(:checkin, 'must be a valid current or future time') if checkin.present? && checkin < Time.now
  end

  def future_checkout_time
    if checkin.present? && checkout.present? &&
       checkout <= checkin
      errors.add(:checkout, 'must be a valid time after your check in ' \
      'time.')
    end
  end
end
