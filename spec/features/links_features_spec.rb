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

end