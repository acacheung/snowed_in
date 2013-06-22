require 'spec_helper'

feature 'Requester cancels request', %{
  As the requester of the request,
  I can cancel the request
  so no further people try to answer my request
  } do

  scenario 'Shoveler cannot cancel request' do
    visit root_path
    click_link 'Sign Up'
    fill_in 'Email', :with => 'requester@snow.com'
    fill_in 'user[password]', :with => 'qwertyuiop'
    fill_in 'user[password_confirmation]', :with => 'qwertyuiop'
    fill_in 'user[street]', :with => '377 Summer Street'
    fill_in 'user[city]', :with => 'Boston'
    select('MA', :from => 'State')
    fill_in 'user[zipcode]', :with => '02210'
    choose('I need help shoveling')
    click_button 'Sign up'
    choose('small')
    choose('$20')
    click_button 'Submit request'
    click_link 'Sign Out'

    click_link 'Sign Up'
    fill_in 'Email', :with => 'amanda@panda.com'
    fill_in 'user[password]', :with => 'qwertyuiop'
    fill_in 'user[password_confirmation]', :with => 'qwertyuiop'
    fill_in 'user[street]', :with => ''
    fill_in 'user[city]', :with => ''
    select('', :from => 'State')
    fill_in 'user[zipcode]', :with => '02210'
    choose('I want to shovel')
    click_button 'Sign up'
    page.should have_content('377 Summer Street')
    page.should have_content('02210')
    click_link '377 Summer Street'
    page.should_not have_content('Cancel your request')
  end

  scenario 'Requester can cancel request' do
    prev_count = Request.count
    visit root_path
    click_link 'Sign Up'
    fill_in 'Email', :with => 'amanda@panda.com'
    fill_in 'user[password]', :with => 'qwertyuiop'
    fill_in 'user[password_confirmation]', :with => 'qwertyuiop'
    fill_in 'user[street]', :with => '377 Summer Street'
    fill_in 'user[city]', :with => 'Boston'
    select('MA', :from => 'State')
    fill_in 'user[zipcode]', :with => '02210'
    choose('I need help shoveling')
    click_button 'Sign up'
    choose('small')
    choose('$20')
    click_button 'Submit request'
    expect(prev_count + 1).to eql(Request.count)
    click_button 'Cancel your request'
    page.should have_content('Your request has been cancelled')
    expect(prev_count).to eql(Request.count)
  end

end
