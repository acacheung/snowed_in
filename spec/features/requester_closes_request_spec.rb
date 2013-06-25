require 'spec_helper'

feature 'Requester closes request to further help', %{
  As a signed in requester,
  I want to close the request to further help
  so other helpers do not contact me about shoveling
  } do

  scenario 'Shoveler cannot close the request to further help' do
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
    choose(20)
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
    click_link '377 Summer Street'
    page.should_not have_content('I found a shoveler!')
  end

  scenario 'Requester can close the request to further help' do
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
    choose(20)
    click_button 'Submit request'
    click_link 'I found a shoveler!'
    within('.your_requests') do
      page.should_not have_content('SMALL')
    end
    within('.your_completed_requests') do
      page.should have_content('SMALL')
    end
  end

end
