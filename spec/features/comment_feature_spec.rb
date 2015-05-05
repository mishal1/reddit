require 'rails_helper'

feature 'commenting' do
  before {Link.create title: 'something'}

  scenario 'allows a user to leave a comment' do
    visit '/links'
    click_link 'Comment'
    fill_in 'Thoughts', with: 'blah'
    select '3', from: 'Rating'
    click_button 'Leave comment'
    expect(current_path).to eq '/links'
    expect(page).to have_content 'blah, 3/5'
  end
end