require 'spec_helper'

feature 'User signs in', %{
  As a user,
  I should be able to sign in to my account
  So I can use the app
  } do

  given(:email)     { 'requester@example.com' }
  given(:password)   { 'qwertyuiop' }

  scenario 'User cannot sign in without filling out the required fields' do
    visit root_path
    click_link 'Sign In'
    fill_in 'Email', :with => ''
    fill_in 'user[password]', :with => ''
    click_button 'Sign in'
    page.should have_content('Invalid email or password')
  end

  scenario 'User can sign in if they already have an account' do
    visit root_path
    click_link 'Sign Up'
    fill_in 'Name', :with => 'Amanda'
    fill_in 'Email', :with => email
    fill_in 'user[password]', :with => password
    fill_in 'user[password_confirmation]', :with => password
    fill_in 'user[address]', :with => '337 Summer Street Boston, MA'
    choose('I need help shoveling')
    click_button 'Sign up'
    click_link 'Sign Out'
    click_link 'Sign In'
    fill_in 'Email', :with => email
    fill_in 'user[password]', :with => password
    click_button 'Sign in'
    page.should have_content('Signed in successfully')
    page.should_not have_content('Sign in')
  end

end
