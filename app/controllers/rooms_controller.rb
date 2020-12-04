class RoomsController < ApplicationController
  def index
    @rooms = Room.all
  end

  def new
    @room = Room.new(params[:room])
    respond_to do |format|
      format.html # new.html.erb
      format.xml { render xml: @room }
    end
  end

  def create
    @room = Room.new(room_params)
    respond_to do |format|
      if @room.save
        format.html { redirect_to(rooms_url, notice: 'Room was successfully created.') }
        format.xml  { render xml: @room, status: :created, location: @room }
      else
        format.html { render action: 'new' }
        format.xml  { render xml: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @room = Room.find(params[:id])
  end

  def update
    @room = Room.find(params[:id])

    respond_to do |format|
      if @room.update_attributes(room_params)
        format.html { redirect_to(rooms_url(notice: 'Room was successfully updated.')) }
        format.xml  { head :ok }
      else
        format.html { render action: 'edit' }
        format.xml  { render xml: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @room = Room.find(params[:id])
    @room.destroy
    @rooms = Room.all
    respond_to do |format|
      format.html { redirect_to(rooms_url(notice: 'Room was successfully deleted.')) }

      format.xml  { head :ok }
    end
  end

  private

  def room_params
    params.require(:room).permit(:number, :price, :room_type)
  end
end
