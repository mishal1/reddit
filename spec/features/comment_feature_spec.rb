require 'rails_helper'
require_relative './feature_helper'

feature 'commenting' do

  before do 
    sign_up
    add_room
    click_link 'name'
    @room_path = current_path
    add_comment
  end

  scenario 'allows a user to leave a comment' do
    expect(current_path).to eq @room_path
    expect(page).to have_content 'user comment'
  end

  scenario 'a user can edit a comment' do
    click_link 'Edit Comment'
    fill_in 'Thoughts', with: 'edited comment'
    click_button 'Update Comment'
    expect(page).to have_content 'edited comment'
    expect(page).not_to have_content 'user comment'
  end

  scenario 'a user can delete a comment' do
    click_link 'Delete Comment'
    expect(page).to have_content 'comment deleted successfully'
    expect(page).not_to have_content 'user comment'
  end

end