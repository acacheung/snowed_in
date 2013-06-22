require 'spec_helper'

feature 'Shoveler can browse requests', %{
  As a shoveler,
  I want to browse requests,
  so I can get matched up with someone who needs shoveling done
  } do

  scenario 'Guest cannot see any requests' do
    visit requests_path
    page.should have_content('You are not authorized!')
  end

  scenario 'Shoveler can browse requests' do
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
    page.should have_content('377 Summer Street')
    page.should have_content('02210')
  end

end
