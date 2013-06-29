require 'spec_helper'

feature "User can edit account", %{
  As a user,
  I want to edit my account information
  so that I can update old info.
  } do

  given(:email)     { 'requester@example.com' }
  given(:password)   { 'qwertyuiop' }

  scenario "Guest cannot edit account" do
    visit edit_user_registration_path
    page.should have_content('You need to sign in or sign up before continuing')
  end

  scenario "User can edit account" do
    visit root_path
    click_link 'Sign Up'
    fill_in 'Email', :with => email
    fill_in 'user[password]', :with => password
    fill_in 'user[password_confirmation]', :with => password
    fill_in 'user[address]', :with => '337 Summer Street Boston, MA'
    choose('I need help shoveling')
    click_button 'Sign up'
    click_link 'Edit account'
    fill_in 'user[current_password]', :with => password
    fill_in 'user[address]', :with => '338 Summer Street Boston, MA'
    click_button 'Update'
    page.should have_content('You updated your account successfully')
  end

end
