require 'rails_helper'

feature 'Client' do 
	scenario 'click on create new client link' do 
		visit clients_path
		click_link 'Create new Client'
		expect(current_path).to eq new_client_path
	end

	scenario 'click on create new organisation link' do 
		visit new_client_path
		click_link 'Create new Organisation'
		expect(current_path).to eq new_organisation_path
	end

	scenario 'create valid client' do
		@organisation = create(:organisation)
		expect {
			visit new_client_path
			select @organisation.name, from: 'client_organisation_id'
			select 'Primary Contact', from: 'client_contact_type'
			fill_in 'first-name', with: Faker::Name.first_name
			fill_in 'last-name', with: Faker::Name.last_name
			fill_in 'email', with: Faker::Internet.email
			fill_in 'telephone', with: Faker::PhoneNumber.phone_number
			fill_in 'note', with: Faker::Lorem.sentence

			click_button 'Save Client'
		}.to change(Client, :count).by(1)
	end

	scenario 'create invalid client' do
		@organisation = create(:organisation)
		expect {
			visit new_client_path
			click_button 'Save Client'
		}.to change(Client, :count).by(0)

		expect(page).to have_content("First name can't be blank")
		expect(page).to have_content("Last name can't be blank")
		expect(page).to have_content("Email can't be blank")
		expect(page).to have_content("Tel can't be blank")
	end
end