require 'rails_helper'

feature 'commenting' do

  before do 
    Link.create title: 'something'
    visit '/links'
    click_link 'Comment'
    fill_in 'Thoughts', with: 'blah'
    select '3', from: 'Rating'
    click_button 'Leave comment'
  end

  scenario 'allows a user to leave a comment' do
    expect(current_path).to eq '/links'
    expect(page).to have_content 'blah, 3/5'
  end

  context 'user deletes link' do

    scenario 'deletes comments automatically' do
      click_link 'Delete'
      expect(page).not_to have_content 'blah, 3/5'
    end

  end

end