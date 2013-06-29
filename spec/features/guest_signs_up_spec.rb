require 'spec_helper'

feature 'Guest signs up', %{
  As a guest,
  I should be able to sign up for an account
  so I can use the app.
  } do

  scenario 'Guest cannot sign up for an account without filling out the required fields' do
    visit root_path
    click_link 'Sign Up'
    click_button 'Sign up'
    page.should have_content("can't be blank")
  end

  scenario 'Guest can sign up for an account' do
    visit root_path
    click_link 'Sign Up'
    fill_in 'Email', :with => 'amanda@panda.com'
    fill_in 'user[password]', :with => 'qwertyuiop'
    fill_in 'user[password_confirmation]', :with => 'qwertyuiop'
    fill_in 'user[address]', :with => '337 Summer Street Boston, MA'
    choose('I need help shoveling')
    click_button 'Sign up'
    page.should have_content('You have signed up successfully')
    page.should_not have_content('Sign up')
  end

end
