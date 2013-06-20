require 'spec_helper'

feature 'User signs out', %{
  As a signed in user,
  I should be able to sign out of my account
  So I don't share my account accidentally
  } do

  scenario 'User can sign out after signing in' do
    visit root_path
    click_link 'Sign Up'
    fill_in 'Email', :with => 'user@gmail.com'
    fill_in 'user[password]', :with => 'qwertyuiop'
    fill_in 'user[password_confirmation]', :with => 'qwertyuiop'
    fill_in 'user[address_street]', :with => '377 Summer Street'
    fill_in 'user[address_city]', :with => 'Boston'
    fill_in 'user[address_state]', :with => 'MA'
    fill_in 'user[address_zipcode]', :with => '02210'
    # choose('')
    click_button 'Sign up'
    click_link 'Sign Out'
    page.should_not have_content('Sign Out')
  end

end
