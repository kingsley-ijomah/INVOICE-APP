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
		visit new_client_path
		select @organisation.id, from: 'Select Organisation'
		selct 'true', from: 'Contact Type'
		fill_in 'first_name', with: Faker::Name.first_name
		fill_in 'last_name', with: Faker::Name.last_name
		fill_in 'email', with: Faker::Internet.email
		fill_in 'tel', with: Faker::PhoneNumber.phone_number
		fill_in 'note', with: Faker::Lorem.sentence

		click_button 'Save Client'

		expect(current_path).to eq clients_path
	end
end