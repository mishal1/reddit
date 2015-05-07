require 'rails_helper'

describe Comment, type: :model do

  it 'deletes comment that belongs to the deleted room' do
    @room = Room.create(name: 'something', id: 1)
    @comment = Comment.create(room_id: 1)
    expect(Comment.all.length).to eq 1
    @room.destroy!
    expect(Comment.all.length).to eq 0
  end

end