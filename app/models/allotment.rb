class Allotment < ApplicationRecord
	belongs_to :user
	belongs_to :room
	after_save :change_room_status

	def change_room_status
		self.room.update_attributes(status: 'booked')
	end

	
end
