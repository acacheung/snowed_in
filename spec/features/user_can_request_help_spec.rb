require 'spec_helper'

feature 'User can request help', %{
  As a signed in user,
  I want to add a request for help shoveling,
  so I can get matched up with a shoveler
  } do

  scenario 'User can add a request for help' do
    visit root_path
    click_link 'Sign Up'
    fill_in 'Email', :with => 'amanda@panda.com'
    fill_in 'user[password]', :with => 'qwertyuiop'
    fill_in 'user[password_confirmation]', :with => 'qwertyuiop'
    fill_in 'user[street]', :with => '377 Summer Street'
    fill_in 'user[city]', :with => 'Boston'
    select('MA', :from => 'State')
    fill_in 'user[zipcode]', :with => '02210'
    choose('I need help shoveling')
    click_button 'Sign up'
    choose('small')
    choose(20)
    click_button 'Submit request'
    page.should have_content('02210')
  end

end
