require 'rails_helper'

feature 'Sign In' do
	scenario 'with valid data' do 
		visit new_user_session_path
		within('#new_session') do 
			fill_in 'email', with: 'kingsley.ijomah@gmail.com'
			fill_in 'password', with: 'thisisatestpassword'
		end
		click_button 'Sign In'
		expect(current_path).to eq(dashboard_index_path)
	end
end