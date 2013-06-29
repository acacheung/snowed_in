require 'spec_helper'

feature 'Requester can request help', %{
  As a signed in user,
  I want to add a request for help shoveling,
  so I can get matched up with a shoveler
  } do

  given(:email1)     { 'requester@example.com' }
  given(:email2)     { 'shoveler@example.com' }
  given(:password)  { 'password'}

  scenario 'Guest cannot request shoveling help' do
    visit requests_path
    page.should have_content('You are not authorized!')
  end

  scenario 'Shoveler cannot request shoveling help' do
    visit root_path
    click_link 'Sign Up'
    fill_in 'Name', :with => 'Amanda'
    fill_in 'Email', :with => email2
    fill_in 'user[password]', :with => password
    fill_in 'user[password_confirmation]', :with => password
    fill_in 'user[address]', :with => '100 Summer Street Boston, MA'
    choose('I want to shovel')
    click_button 'Sign up'
    page.should_not have_content('Post a new request')
  end

  scenario 'Requester can request shoveling' do
    visit root_path
    click_link 'Sign Up'
    fill_in 'Name', :with => 'Minnie'
    fill_in 'Email', :with => email1
    fill_in 'user[password]', :with => password
    fill_in 'user[password_confirmation]', :with => password
    fill_in 'user[address]', :with => '337 Summer Street Boston, MA'
    choose('I need help shoveling')
    click_button 'Sign up'
    choose('small')
    choose(20)
    click_button 'Submit request'
    page.should have_content('337 Summer Street')
  end

end
