require 'spec_helper'

feature 'Requester closes request to further help', %{
  As a signed in requester,
  I want to close the request to further help
  so other helpers do not contact me about shoveling
  } do

  given(:email1)     { 'requester@example.com' }
  given(:email2)     { 'shoveler@example.com' }
  given(:password)   { 'qwertyuiop' }

  scenario 'Shoveler cannot close the request to further help' do
    visit root_path
    click_link 'Sign Up'
    fill_in 'Email', :with => email1
    fill_in 'user[password]', :with => password
    fill_in 'user[password_confirmation]', :with => password
    fill_in 'user[street]', :with => '377 Summer Street'
    fill_in 'user[zipcode]', :with => '02210'
    choose('I need help shoveling')
    click_button 'Sign up'
    choose('small')
    choose(20)
    click_button 'Submit request'
    click_link 'Sign Out'

    click_link 'Sign Up'
    fill_in 'Email', :with => email2
    fill_in 'user[password]', :with => password
    fill_in 'user[password_confirmation]', :with => password
    fill_in 'user[zipcode]', :with => '02210'
    choose('I want to shovel')
    click_button 'Sign up'
    click_link '377 Summer Street'
    page.should_not have_content('I found a shoveler!')
  end

  scenario 'Requester can close the request to further help' do
    visit root_path
    click_link 'Sign Up'
    fill_in 'Email', :with => email1
    fill_in 'user[password]', :with => password
    fill_in 'user[password_confirmation]', :with => password
    fill_in 'user[street]', :with => '377 Summer Street'
    fill_in 'user[zipcode]', :with => '02210'
    choose('I need help shoveling')
    click_button 'Sign up'
    choose('small')
    choose(20)
    click_button 'Submit request'
    click_link 'Sign Out'

    visit root_path
    click_link 'Sign Up'
    fill_in 'Email', :with => email2
    fill_in 'user[password]', :with => password
    fill_in 'user[password_confirmation]', :with => password
    fill_in 'user[street]', :with => '376 Summer Street'
    fill_in 'user[zipcode]', :with => '02210'
    choose('I want to shovel')
    click_button 'Sign up'
    page.should have_content('SMALL')
    click_link 'Sign Out'

    visit root_path
    click_link 'Sign In'
    fill_in 'Email', :with => email1
    fill_in 'user[password]', :with => password
    click_button 'Sign in'
    click_button 'I found a shoveler!'
    click_link 'Sign Out'

    visit root_path
    click_link 'Sign In'
    fill_in 'Email', :with => email2
    fill_in 'user[password]', :with => password
    click_button 'Sign in'
    page.should_not have_content('SMALL')
  end

end
