require 'rails_helper'

feature 'Sign In' do
	background do 
		@user = create(:user)
	end

	scenario 'with valid data' do 
		sign_in(password: @user.password, redirect_path: root_path)
	end

	scenario 'with invalid data' do 
		sign_in(password: 'fake-pwd', redirect_path: new_user_session_path)
	end
end

def sign_in(password:, redirect_path:)
	visit new_user_session_path
	within('#new_session') do 
		fill_in 'email', with: @user.email
		fill_in 'password', with: password
	end
	click_button 'Sign In'
	expect(current_path).to eq(redirect_path)
end