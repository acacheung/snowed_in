require 'spec_helper'

feature 'Requester can only have one open/matched request at a time', %{
  As a signed in requester,
  I can only have one request open/matched at any given time
  because it does not make sense to have more than one.
  } do

  given(:email)     { 'requester@example.com' }
  given(:password)  { 'password' }

  scenario 'Requester can only have one open/matched request' do
    visit root_path
    click_link 'Sign Up'
    fill_in 'Email', :with => email
    fill_in 'user[password]', :with => password
    fill_in 'user[password_confirmation]', :with => password
    fill_in 'user[address]', :with => '337 Summer Street Boston, MA'
    choose('I need help shoveling')
    click_button 'Sign up'
    choose('small')
    choose(20)
    click_button 'Submit request'
    page.should_not have_content('Post a new request')
  end

end
