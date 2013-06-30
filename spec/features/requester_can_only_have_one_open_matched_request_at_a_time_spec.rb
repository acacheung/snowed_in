require 'spec_helper'

feature 'Requester can only have one open/matched request at a time', %{
  As a signed in requester,
  I can only have one request open/matched at any given time
  because it does not make sense to have more than one.
  } do

  given(:name)      { 'Amanda' }
  given(:email)     { 'requester@example.com' }
  given(:password)  { 'password' }

  scenario 'Requester can only have one open/matched request' do
    visit root_path
    click_link 'Sign Up'
    fill_in 'Name', :with => name
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

  scenario 'Requester can see past requests if she has any' do
    visit root_path
    click_link 'Sign Up'
    fill_in 'Name', :with => 'Amanda'
    fill_in 'Email', :with => email
    fill_in 'user[password]', :with => password
    fill_in 'user[password_confirmation]', :with => password
    fill_in 'user[address]', :with => '337 Summer Street Boston, MA'
    choose('I need help shoveling')
    click_button 'Sign up'
    choose('small')
    choose(20)
    click_button 'Submit request'
    click_button('I found a shoveler!')
    click_button('Request has been completed!')
    page.should have_content('My past requests')
  end

  scenario 'Requester cannot see past requests if she does not have any' do
    visit root_path
    click_link 'Sign Up'
    fill_in 'Name', :with => 'Amanda'
    fill_in 'Email', :with => email
    fill_in 'user[password]', :with => password
    fill_in 'user[password_confirmation]', :with => password
    fill_in 'user[address]', :with => '337 Summer Street Boston, MA'
    choose('I need help shoveling')
    click_button 'Sign up'
    page.should_not have_content('My past requests')
  end

end
