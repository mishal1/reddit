require 'rails_helper'

feature 'commenting' do

  before do 
    @room = Room.create name: 'something'
    visit '/rooms'
    click_link 'something'
    click_link 'Comment'
    fill_in 'Thoughts', with: 'blah'
    click_button 'Leave comment'
  end

  scenario 'allows a user to leave a comment' do
    expect(current_path).to eq "/rooms/#{@room.id}"
    expect(page).to have_content 'blah'
  end

end