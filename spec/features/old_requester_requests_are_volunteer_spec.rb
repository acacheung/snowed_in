require 'spec_helper'

feature 'Old / uncapable requester requests are for volunteer', %{
  As a requester that is old or disabled,
  I want to set my offer to zero
  so shovelers can volunteer to help me
  } do

  given(:email)     { 'requester@example.com' }
  given(:password)  { 'qwertyuiop' }

  scenario 'Capable requester can see offer select when creating a request' do
    visit root_path
    click_link 'Sign Up'
    fill_in 'Email', :with => email
    fill_in 'user[password]', :with => password
    fill_in 'user[password_confirmation]', :with => password
    fill_in 'user[street]', :with => '377 Summer Street'
    fill_in 'user[zipcode]', :with => '02210'
    choose('I need help shoveling')
    click_button 'Sign up'
    choose('small')
    page.should have_content('Offer')
  end

  scenario 'Old / uncapable requester cannot see offer select when creating a request' do
    visit root_path
    click_link 'Sign Up'
    fill_in 'Email', :with => email
    fill_in 'user[password]', :with => password
    fill_in 'user[password_confirmation]', :with => password
    fill_in 'user[street]', :with => '377 Summer Street'
    fill_in 'user[zipcode]', :with => '02210'
    choose('I need help shoveling')
    check('user_old_or_disabled')
    click_button 'Sign up'
    choose('small')
    page.should_not have_content('Offer')
  end

end
