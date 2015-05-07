class AddRoomIdToComments < ActiveRecord::Migration
  def change
    add_reference :comments, :room, index: true
  end
end
