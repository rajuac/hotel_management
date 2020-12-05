class Room < ApplicationRecord
  has_many :allotments
  has_one :active_allotment, -> { where status: 'booked' }, class_name: "Room"

  scope :available, lambda {
                      where(status: [nil, ''])
                    }

  def room_status
    status == 'booked' ? 'Booked' : 'Available'
  end
end
