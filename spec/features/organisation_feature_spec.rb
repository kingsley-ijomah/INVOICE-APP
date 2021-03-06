require 'rails_helper'

feature 'Organisation' do
	scenario 'create valid organisation' do 
		visit new_organisation_path
      @company = Faker::Company.name
			within '#organisaton_form' do
				fill_in 'company-name', with: @company
				fill_in 'street_1', with: Faker::Address.street_name
				fill_in 'street_2', with: Faker::Address.secondary_address
				fill_in 'city', with: Faker::Address.city
				fill_in 'town', with: Faker::Address.state
				fill_in 'post-code', with: Faker::Address.postcode
			end
			click_button 'Create Organisation'
      expect(page.find('#client_organisation_id')).to have_content(@company)
	end

	scenario 'create invalid organisation' do
		expect {
			visit new_organisation_path
			click_button 'Create Organisation'
		}.to change(Organisation, :count).by(0)

		expect(page.find('#validation-errors')).to have_content("Name can't be blank")
		expect(page.find('#validation-errors')).to have_content("Street 1 can't be blank")
		expect(page.find('#validation-errors')).to have_content("City can't be blank")
		expect(page.find('#validation-errors')).to have_content("Town can't be blank")
	end
end
