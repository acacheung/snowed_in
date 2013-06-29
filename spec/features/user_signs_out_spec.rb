require 'spec_helper'

feature 'User signs out', %{
  As a signed in user,
  I should be able to sign out of my account
  So I don't share my account accidentally
  } do

  scenario 'User can sign out after signing in' do
    visit root_path
    click_link 'Sign Up'
    fill_in 'Name', :with => 'Amanda'
    fill_in 'Email', :with => 'user@gmail.com'
    fill_in 'user[password]', :with => 'qwertyuiop'
    fill_in 'user[password_confirmation]', :with => 'qwertyuiop'
    fill_in 'user[address]', :with => '377 Summer Street Boston, MA'
    choose('I need help shoveling')
    click_button 'Sign up'
    click_link 'Sign Out'
    page.should_not have_content('Sign Out')
  end

end
