require 'spec_helper'

feature 'Requester cancels request', %{
  As the requester of the request,
  I can cancel the request
  so no further people try to answer my request
  } do

  given(:email1)     { 'requester@example.com' }
  given(:email2)     { 'shoveler@example.com' }
  given(:password)  { 'password'}

  scenario 'Shoveler cannot cancel request' do
    visit root_path
    click_link 'Sign Up'
    fill_in 'Email', :with => email1
    fill_in 'user[password]', :with => password
    fill_in 'user[password_confirmation]', :with => password
    fill_in 'user[address]', :with => '337 Summer Street Boston, MA'
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
    fill_in 'user[address]', :with => '100 Summer Street Boston, MA'
    choose('I want to shovel')
    click_button 'Sign up'
    page.should have_content('337 Summer Street')
    click_link '337 Summer Street'
    page.should_not have_content('Cancel your request')
  end

  scenario 'Requester can cancel request' do
    visit root_path
    click_link 'Sign Up'
    fill_in 'Email', :with => email1
    fill_in 'user[password]', :with => password
    fill_in 'user[password_confirmation]', :with => password
    fill_in 'user[address]', :with => '337 Summer Street Boston, MA'
    choose('I need help shoveling')
    click_button 'Sign up'
    choose('small')
    choose(20)
    click_button 'Submit request'
    click_button 'Cancel your request'
    page.should have_content('Your request has been cancelled')
  end

end
