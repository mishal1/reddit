require 'rails_helper'

feature 'user' do
  context 'user not sign in and on the homepage' do

    it 'should see a sign in and sign up link' do
      visit '/'
      expect(page).to have_link 'Sign in'
      expect(page).to have_link 'Sign up'
    end

    it 'should not see sign out link' do
      visit '/'
      expect(page).not_to have_link 'Sign out'
    end

    it 'should not allow user to add a new room' do
      visit '/'
      expect(page).not_to have_link 'Add a room'
    end

  end

  context 'user signed in on the homepage' do

    before do
      sign_up
    end

    it "should see 'sign out' link" do
      visit '/'
      expect(page).to have_link 'Sign out'
    end

    it "should not see a 'sign in' link and a 'sign up' link" do
      visit '/'
      expect(page).not_to have_link 'Sign in'
      expect(page).not_to have_link 'Sign up'
    end

  end

end