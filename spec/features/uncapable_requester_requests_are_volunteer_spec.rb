require 'spec_helper'

feature 'Uncapable requester requests are for volunteer', %{
  As a requester that is old or disabled,
  I want to set my offer to zero
  so shovelers can volunteer to help me
  } do

  scenario 'Uncapable requester cannot see offer select when creating a request' do
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
    check('user_old_or_disabled')
    click_button 'Sign up'
    choose('small')
    click_button 'Submit request'
    page.should have_content('02210')
  end

end
