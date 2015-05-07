require 'rails_helper'

feature 'room' do

  def add_room(name = 'name')
    visit '/rooms'
    click_link 'Add a room'
    fill_in 'Name', with: name
    fill_in 'Description', with: 'description'
    click_button 'Create Room'
  end

  context 'no rooms have been added' do

    scenario 'should display a prompt to add a room' do
      visit '/rooms'
      expect(page).to have_content 'No rooms yet'
      expect(page).to have_link 'Add a room'
    end

  end

  context 'rooms have been added' do

    before { add_room }

    context 'creating rooms' do
      scenario 'prompts user to fill out a form, then displays the new room' do
        expect(page).to have_content 'name: description'
        expect(current_path).to eq '/rooms'
      end
    end

    context 'editing rooms' do
      scenario 'let a user edit a restaurant' do
        visit '/rooms'
        click_link 'Edit'
        fill_in 'Name', with: 'something else'
        click_button 'Update Room'
        expect(page).to have_content 'something else'
        expect(current_path).to eq '/rooms'
      end
    end

    context 'deleting rooms' do
      scenario 'removes a room when a user clicks a delete room' do
        visit '/rooms'
        click_link 'Delete'
        expect(page).not_to have_content 'something'
        expect(page).to have_content 'room deleted successfully'
      end
    end

  end

  context 'viewing rooms' do

    let!(:room) { Room.create(name: 'something', description: 'des') }

    scenario 'lets a user view a room' do
      visit '/rooms'
      click_link 'something'
      expect(page).to have_content 'something'
      expect(current_path).to eq "/rooms/#{room.id}"
    end

  end

  context 'an invlid room' do
    it 'does not let you submit a name that is too short' do
      add_room('ab')
      expect(page).to have_content 'Name is too short'
    end
  end

end