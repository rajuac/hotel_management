class Room < ApplicationRecord
  has_one :allotment
  # scope :available,{:conditions => "status is NULL"}
  scope :available, lambda {
                      where(status: [nil, ''])
                    }

  def room_status
    status == 'booked' ? 'Booked' : 'Available'
  end
end
