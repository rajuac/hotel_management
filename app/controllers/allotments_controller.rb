class AllotmentsController < ApplicationController
  def rooms
    @rooms_available = Room.available
  end

  def book_room
    @allotment = Allotment.new(params[:allotment])
  end

  def create_allot
    @allotment = Allotment.new(allot_params)
    respond_to do |format|
      if @allotment.save
        format.html { redirect_to(customers_url, notice: 'Room  was Booked successfully.') }
        format.xml  { render xml: @customer, status: :created, location: @room }
      else
        format.html { render action: 'book_room' }
        format.xml { render xml: @allotment.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def allot_params
    params.require(:allotment).permit(:checkin, :checkout)
  end
end
