class AllotmentsController < ApplicationController
  def index
    @allots = Allotment.all
  end

  def rooms
    @rooms_available = Room.available
    @user = User.find(params[:user_id])
  end

  def book_room
    @allotment = Allotment.new(params[:allotment])
    @user = User.find(params[:u_id])
    @room = Room.find(params[:id])
  end

  def create_allot
    @user = User.find(allot_params[:user_id])
    @room = Room.find(allot_params[:room_id])
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

  def checkout
    @allotment = Allotment.find(params[:id])
    respond_to do |format|
      if @allotment.update!(status: 'vaccated')
        format.html { redirect_to(allotments_url, notice: 'Room  was checkout successfully.') }
      end
    end
  end

  private

  def allot_params
    params.require(:allotment).permit(:checkin, :checkout, :user_id, :room_id,:status)
  end
end
