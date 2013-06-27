require 'spec_helper'

feature "User resets password", %{
  As a user,
  I want to reset my password when I forget my password
  so I can continue to use the app.
  } do

  given(:email)     { 'user@example.com' }
  given(:password)  { 'password'}

  scenario "User receives an email after clicking reset password" do
    visit new_user_registration_path
    fill_in 'Email', with: email
    fill_in 'user_password', with: password
    fill_in 'user_password_confirmation', with: password
    fill_in 'Zipcode', with: '02461'
    choose('I need help shoveling')
    click_button 'Sign up'
    click_link 'Sign Out'
    visit new_user_password_path
    prev_deliveries = ActionMailer::Base.deliveries.count
    fill_in 'Email', with: email
    click_button 'Send me reset password instructions'
    expect(ActionMailer::Base.deliveries.count).to eql(prev_deliveries + 1)
  end

  scenario "User sees a link to reset password in email" do
    visit new_user_registration_path
    fill_in 'Email', with: email
    fill_in 'user_password', with: password
    fill_in 'user_password_confirmation', with: password
    fill_in 'Zipcode', with: '02461'
    choose('I need help shoveling')
    click_button 'Sign up'
    click_link 'Sign Out'
    visit new_user_password_path
    fill_in 'Email', with: email
    click_button 'Send me reset password instructions'
    last_delivery = ActionMailer::Base.deliveries.last
    expect(last_delivery.body).to include('Change my password')
  end

  scenario "User sees a message that they have reset their password" do
    visit new_user_registration_path
    fill_in 'Email', with: email
    fill_in 'user_password', with: password
    fill_in 'user_password_confirmation', with: password
    fill_in 'Zipcode', with: '02461'
    choose('I need help shoveling')
    click_button 'Sign up'
    click_link 'Sign Out'
    visit new_user_password_path
    fill_in 'Email', with: email
    click_button 'Send me reset password instructions'
    reset_link = "/users/password/edit?reset_password_token=#{User.last.reset_password_token}"
    visit reset_link
    fill_in 'user_password', with: 'newpassword'
    fill_in 'user_password_confirmation', with: 'newpassword'
    click_button 'Change my password'
    expect(page).to have_content("Your password was changed successfully")
  end

end
