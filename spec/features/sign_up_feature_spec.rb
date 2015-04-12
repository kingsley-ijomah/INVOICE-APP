require "rails_helper"

feature "user creates account" do
  scenario "with valid data" do
  	visit new_user_registration_path
  		fill_in 'user_name', with: 'kingsley'
	  	fill_in 'user_email', with: 'kingsley@test.com'
	  	fill_in 'user_password', with: 'thisisatestpassword'
	  	fill_in 'user_password_confirmation', with: 'thisisatestpassword'
	  	click_button 'sign_up'

	 	 	expect(current_path).to eq(root_path)
  end

  scenario "with invalid data" do

  end
end