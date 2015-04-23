require 'rails_helper'

feature 'Main Site Navigation' do 
	scenario 'dashboard path' do 
		visit clients_path

		within('#main_navigation') do
			click_link 'Dashboard'
		end
		expect(current_path).to eq dashboard_index_path
	end

	scenario 'clients path' do 
		visit dashboard_index_path

		within('#main_navigation') do
			click_link 'Clients'
		end
		expect(current_path).to eq clients_path
	end

	scenario 'invoices path' do 
		visit dashboard_index_path

		within('#main_navigation') do
			click_link 'Invoices'
		end
		expect(current_path).to eq invoices_path
	end
end