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
end