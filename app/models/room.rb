class Room < ApplicationRecord
	has_one :allotment
	#scope :available,{:conditions => "status is NULL"}
	scope :available, -> {
  where(status: [nil, ""])
}


def room_status
return status == "booked" ? "Booked" : "Available"
end


end
