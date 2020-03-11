require 'rails_helper'

RSpec.describe 'login followed by logout', type: :feature do
    let(:user) { User.create(username: 'maru', fullname: 'Maria Eugenia Queme') }
  
    scenario 'login page' do
      visit root_path
      fill_in 'session_username', with: user.username
      click_button 'Log in'
      sleep(3)
      expect(page).to have_content('User Logged in')
      click_on 'Log out'
      sleep(3)
      expect(page). to have_content('Please log in')
    end
  end