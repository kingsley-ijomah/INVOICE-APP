require 'rails_helper'

feature 'Organisation' do
	scenario 'Create organisation' do 
		visit new_organisation_path
		expect {
			within '#organisaton_form' do
				fill_in 'company-name', with: Faker::Company.name
				fill_in 'street_1', with: Faker::Address.street_name
				fill_in 'street_2', with: Faker::Address.secondary_address
				fill_in 'city', with: Faker::Address.city
				fill_in 'town', with: Faker::Address.state
				fill_in 'post-code', with: Faker::Address.postcode
			end
			click_button 'Create Organisation'
		}.to change(Organisation, :count).by(1)
	end
end