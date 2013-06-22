require 'spec_helper'

feature 'Shoveler can browse requests', %{
  As a shoveler,
  I want to browse requests,
  so I can get matched up with someone who needs shoveling done
  } do

  scenario 'Guest cannot see any requests'

  scenario 'Shoveler can browse requests' do
    visit root_path
    click_link 'Sign Up'
    fill_in 'Email', :with => 'requester@snow.com'
    fill_in 'user[password]', :with => 'qwertyuiop'
    fill_in 'user[password_confirmation]', :with => 'qwertyuiop'
    fill_in 'user[street]', :with => '377 Summer Street'
    fill_in 'user[city]', :with => 'Boston'
    fill_in 'user[state]', :with => 'MA'
    fill_in 'user[zipcode]', :with => '02210'
    choose('I need help shoveling')
    click_button 'Sign up'
    click_link 'Sign Out'

    click_link 'Sign Up'
    fill_in 'Email', :with => 'amanda@panda.com'
    fill_in 'user[password]', :with => 'qwertyuiop'
    fill_in 'user[password_confirmation]', :with => 'qwertyuiop'
    fill_in 'user[street]', :with => ''
    fill_in 'user[city]', :with => ''
    fill_in 'user[state]', :with => ''
    fill_in 'user[zipcode]', :with => '02210'
    choose('I want to shovel')
    click_button 'Sign up'
    page.should have_content('377 Summer Street')
    page.should have_content('02210')
  end

end
