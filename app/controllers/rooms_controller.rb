class RoomsController < ApplicationController
  def index
    @rooms = Room.all
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      redirect_to '/rooms'
    else
      render 'new'
    end
  end

  def show
    @room = find_room
  end

  def edit
    @room = find_room
  end

  def update
    @room = find_room
    @room.update(room_params)
    redirect_to '/rooms'
  end

  def destroy
    @room = find_room
    @room.destroy
    flash[:notice] = 'room deleted successfully'
    redirect_to '/rooms'
  end

  def room_params
    params.require(:room).permit(:name, :description)
  end

  def find_room
    Room.find(params[:id])
  end
end
