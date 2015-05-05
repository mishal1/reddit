require 'rails_helper'

feature 'links' do

  context 'no links have been added' do

    scenario 'should display a prompt to add a link' do
      visit '/links'
      expect(page).to have_content 'No links yet'
      expect(page).to have_link 'Add a link'
    end

  end

  context 'links have been added' do

    before do
      Link.create(title: 'title')
    end

    scenario 'display links' do
      visit '/links'
      expect(page).to have_content 'title'
      expect(page).not_to have_content 'No links yet'
    end

  end

  context 'creating links' do
    scenario 'prompts user to fill out a form, then displays the new link' do
      visit '/links'
      click_link 'Add a link'
      fill_in 'Title', with: 'title'
      click_button 'Create Link'
      expect(page).to have_content 'title'
      expect(current_path).to eq '/links'
    end
  end

  context 'viewing links' do

    let!(:link){Link.create(title: 'something')}

    scenario 'lets a user view a link' do
      visit '/links'
      click_link 'something'
      expect(page).to have_content 'something'
      expect(current_path).to eq "/links/#{link.id}"
    end

  end

  context 'editing links' do

    before {Link.create title: 'something'}

    scenario 'let a user edit a restaurant' do
      visit '/links'
      click_link 'Edit'
      fill_in 'Title', with: 'something else'
      click_button 'Update Link'
      expect(page).to have_content 'something else'
      expect(current_path).to eq '/links'
    end

  end

end