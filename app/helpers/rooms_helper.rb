module RoomsHelper
  def book_link(room)
    ss = status == 'booked' ? 'Book' : 'Book'
    link_to ss, allot_rrom_path(room)
  end
end
