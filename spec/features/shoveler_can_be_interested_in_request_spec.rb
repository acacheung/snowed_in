require 'spec_helper'

feature 'Shoveler can be interested in a request', %{
  As the shoveler,
  I can say I am interested in a request
  so I can chat with the requester of the request.
  } do

  given(:email1)     { 'requester@example.com' }
  given(:email2)     { 'shoveler@example.com' }
  given(:password)  { 'password'}

  scenario 'Shoveler can be interested in a request' do
    visit root_path
    click_link 'Sign Up'
    fill_in 'Name', :with => 'Amanda'
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
    fill_in 'Name', :with => 'Minnie'
    fill_in 'Email', :with => email2
    fill_in 'user[password]', :with => password
    fill_in 'user[password_confirmation]', :with => password
    fill_in 'user[address]', :with => '100 Summer Street Boston, MA'
    choose('I want to shovel')
    click_button 'Sign up'
    click_link '337 Summer Street'
    click_link "I'm interested!"
    expect(page).to have_content('Chat')
  end

  scenario 'Requester cannot be interested in a request' do
    visit root_path
    click_link 'Sign Up'
    fill_in 'Name', :with => 'Amanda'
    fill_in 'Email', :with => email1
    fill_in 'user[password]', :with => password
    fill_in 'user[password_confirmation]', :with => password
    fill_in 'user[address]', :with => '337 Summer Street Boston, MA'
    choose('I need help shoveling')
    click_button 'Sign up'
    choose('small')
    choose(20)
    click_button 'Submit request'
    expect(page).to_not have_content("I'm interested!")
  end

end
