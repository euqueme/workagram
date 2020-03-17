require 'rails_helper'

RSpec.describe 'Profile management', type: :feature do
  let(:user) { User.create(username: 'maruk', fullname: 'Maria Eugenia Queme') }
  let(:picture) { 'app/assets/images/1000.png' }
  let(:followed) { User.create(username: 'audrey', fullname: 'Audrey Odiaka') }

  scenario 'Update cover image' do
    visit root_path
    fill_in 'session_username', with: user.username
    click_button 'Log in'
    sleep(3)
    click_on 'PROFILE'
    expect(page). to have_content('ALL WORKS / NO REPLIES')

    attach_file 'user_coverimage', picture
    click_button 'Update coverimage'
    sleep(3)

    expect(page). to have_content('User updated')
    expect(page).to have_css("img[src*='1000.png']")
  end

  scenario 'Update photo' do
    visit root_path
    fill_in 'session_username', with: user.username
    click_button 'Log in'
    sleep(3)
    click_on 'PROFILE'
    expect(page). to have_content('ALL WORKS / NO REPLIES')

    attach_file 'user_photo', picture
    click_button 'Update photo'
    sleep(3)

    expect(page). to have_content('User updated')
    expect(page).to have_css("img[src*='1000.png']")
  end
end
