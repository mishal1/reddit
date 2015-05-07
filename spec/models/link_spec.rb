require 'spec_helper'

describe Room, type: :model do
#   it { is_expected.to have_many :comments }

  it 'is not valid with a name of less than three characters' do
    room = Room.new(name: "ab")
    expect(room).to have(1).error_on(:name)
    expect(room).not_to be_valid
  end

end