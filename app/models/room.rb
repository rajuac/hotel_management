class Room < ApplicationRecord
  has_many :allotments
  has_one :active_allotment, -> { where is_booked: true }, class_name: 'Room'

  scope :available, lambda {
                      where(is_booked: false)
                    }
  validates :number, uniqueness: true
  validates_presence_of :price

  def room_status
    is_booked ? 'Booked' : 'Available'
  end
end
