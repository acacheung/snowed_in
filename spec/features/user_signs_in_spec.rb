require 'spec_helper'

feature 'User signs in', %{
  As a user,
  I should be able to sign in to my account
  So I can use the app
  } do

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
    fill_in 'Email', :with => 'amanda@panda.com'
    fill_in 'user[password]', :with => 'qwertyuiop'
    fill_in 'user[password_confirmation]', :with => 'qwertyuiop'
    fill_in 'user[street]', :with => '377 Summer Street'
    fill_in 'user[city]', :with => 'Boston'
    fill_in 'user[state]', :with => 'MA'
    fill_in 'user[zipcode]', :with => '02210'
    choose('I need help shoveling')
    click_button 'Sign up'
    click_link 'Sign Out'
    click_link 'Sign In'
    fill_in 'Email', :with => 'amanda@panda.com'
    fill_in 'user[password]', :with => 'qwertyuiop'
    click_button 'Sign in'
    page.should have_content('Signed in successfully')
    page.should_not have_content('Sign in')
  end

end
