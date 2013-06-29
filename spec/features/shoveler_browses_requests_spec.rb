require 'spec_helper'

feature 'Shoveler browses requests', %{
  As a shoveler,
  I want to browse requests,
  so I can get matched up with a request suited to what I want
  } do

  given(:email1)     { 'requester@example.com' }
  given(:email2)     { 'shoveler@example.com' }
  given(:password)  { 'password'}

  scenario 'Guest cannot see volunteer or for money requests' do
    visit requests_path
    page.should have_content('You are not authorized!')
  end

  scenario 'Shoveler sees volunteer requests' do
    visit root_path
    click_link 'Sign Up'
    fill_in 'Email', :with => email1
    fill_in 'user[password]', :with => password
    fill_in 'user[password_confirmation]', :with => password
    fill_in 'user[address]', :with => '337 Summer Street Boston, MA'
    choose('I need help shoveling')
    check('user_old_or_disabled')
    click_button 'Sign up'
    choose('small')
    click_button 'Submit request'
    click_link 'Sign Out'

    click_link 'Sign Up'
    fill_in 'Email', :with => email2
    fill_in 'user[password]', :with => password
    fill_in 'user[password_confirmation]', :with => password
    fill_in 'user[address]', :with => '100 Summer Street Boston, MA'
    choose('I want to shovel')
    click_button 'Sign up'
    page.should have_content('FOR VOLUNTEER')
    page.should have_content('SMALL')
    # TODO: TEST MIGHT NOT BE GOOD ENOUGH
  end

  scenario 'Shoveler sees for money requests' do
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
    page.should have_content('FOR MONEYS')
    page.should have_content('SMALL')
    # TODO: TEST MIGHT NOT BE GOOD ENOUGH
  end

end
