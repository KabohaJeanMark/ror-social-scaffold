require 'rails_helper'

feature 'Creating a post' do
  background do
    user = User.new(name: 'jean', password: '123456', email: 'jean@example.com')
    visit new_user_registration_path
    fill_in 'user_name', with: user.name
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    fill_in 'user_password_confirmation', with: user.password
    click_button 'Sign up'
  end

  scenario 'Post creation by signed in user' do
    visit posts_path
    fill_in 'post_content', with: 'First post'
    click_button 'Save'
    expect(page).to have_content('First post')
  end
end
