require 'rails_helper'

feature 'links' do

  def add_link(title = 'title')
    visit '/links'
    click_link 'Add a link'
    fill_in 'Title', with: title
    fill_in 'Url', with: 'url'
    click_button 'Create Link'
  end

  context 'no links have been added' do

    scenario 'should display a prompt to add a link' do
      visit '/links'
      expect(page).to have_content 'No links yet'
      expect(page).to have_link 'Add a link'
    end

  end

  context 'links have been added' do

    before { add_link }

    context 'creating links' do
      scenario 'prompts user to fill out a form, then displays the new link' do
        expect(page).to have_content 'title: url'
        expect(current_path).to eq '/links'
      end
    end

    scenario 'display links' do
      visit '/links'
      expect(page).to have_content 'title'
      expect(page).not_to have_content 'No links yet'
    end
  
    context 'editing links' do
      scenario 'let a user edit a restaurant' do
        visit '/links'
        click_link 'Edit'
        fill_in 'Title', with: 'something else'
        click_button 'Update Link'
        expect(page).to have_content 'something else'
        expect(current_path).to eq '/links'
      end
    end

    context 'deleting links' do
      scenario 'removes a link when a user clicks a delete link' do
        visit '/links'
        click_link 'Delete'
        expect(page).not_to have_content 'something'
        expect(page).to have_content 'Link deleted successfully'
      end
    end

  end

  context 'viewing links' do

    let!(:link) { Link.create(title: 'something') }

    scenario 'lets a user view a link' do
      visit '/links'
      click_link 'something'
      expect(page).to have_content 'something'
      expect(current_path).to eq "/links/#{link.id}"
    end

  end

  context 'an invlid link' do
    it 'does not let you submit a title that is too short' do
      add_link('ab')
      expect(page).to have_content 'Title is too short'
    end
    it 'does not let you submit a link unless it has a unique link' do
      2.times { add_link }
      expect(page).to have_content 'Url has already been taken'
    end
  end

end