require 'rails_helper'

feature 'Sign In' do
	background do 
		@user = create(:user)
	end

	scenario 'with valid data', js: true do 
		visit new_user_session_path
		within('#new_session') do 
			fill_in 'email', with: @user.email
			fill_in 'password', with: @user.password
		end
		click_button 'Sign In'
		expect(current_path).to eq(root_path)
	end
end