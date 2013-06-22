require 'spec_helper'

feature 'Requester can browse own requests', %{
  As the requester,
  I can browse my own requests
  so I can see my old requests and cancel a present request
  } do

  scenario 'Requester can browse old requests'
  #   prev_count = Request.count
  #   visit root_path
  #   click_link 'Sign Up'
  #   fill_in 'Email', :with => 'amanda@panda.com'
  #   fill_in 'user[password]', :with => 'qwertyuiop'
  #   fill_in 'user[password_confirmation]', :with => 'qwertyuiop'
  #   fill_in 'user[street]', :with => '377 Summer Street'
  #   fill_in 'user[city]', :with => 'Boston'
  #   fill_in 'user[state]', :with => 'MA'
  #   fill_in 'user[zipcode]', :with => '02210'
  #   choose('I need help shoveling')
  #   click_button 'Sign up'
  #   choose('small')
  #   choose('$20')
  #   click_button 'Submit request'
  #   click_button 'Cancel your request'
  #   page.should have_content('Your request has been cancelled')
  #   expect(prev_count - 1).to eql(Request.count)
  # end

  scenario 'Requester can browse current requests'

end
