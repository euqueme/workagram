require 'rails_helper'

RSpec.describe 'Home management', type: :feature do
  let(:user) { User.create(username: 'maru', fullname: 'Maria Eugenia Queme') }
  let(:picture) { 'app/assets/images/1000.png' }
  let(:followed) { User.create(username: 'audrey', fullname: 'Audrey Odiaka') }

  scenario 'Create valid work' do
    visit root_path
    fill_in 'session_username', with: user.username
    click_button 'Log in'
    sleep(3)
    expect(page). to have_content('WORKAGRAM SOMETHING')

    attach_file 'work_picture', picture
    click_button 'Post'
    sleep(3)

    expect(page). to have_content('work created!')
    expect(page).to have_css("img[src*='1000.png']")
  end

  scenario 'Create invalid work' do
    visit root_path
    fill_in 'session_username', with: user.username
    click_button 'Log in'
    sleep(3)
    expect(page). to have_content('WORKAGRAM SOMETHING')

    click_button 'Post'
    sleep(3)

    expect(page). to have_content("couldn\'nt create work")
  end

  scenario 'See following works' do
    Following.create(followed_id: followed.id, follower_id: user.id)

    visit root_path
    fill_in 'session_username', with: followed.username
    click_button 'Log in'
    sleep(3)
    attach_file 'work_picture', picture
    fill_in 'work_text', with: 'Followed job update'
    click_button 'Post'
    sleep(3)
    click_on 'Log out'
    sleep(3)

    visit root_path
    fill_in 'session_username', with: user.username
    click_button 'Log in'
    sleep(3)

    expect(page). to have_content('Followed job update')
  end
end
