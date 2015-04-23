require 'rails_helper'

feature Invoice do
	scenario 'valid invoice' do 
		client = create(:client)

		visit invoices_path
		select client.name, from: 'client_select'
		fill_in 'number', with: '11'
		fill_in 'date_of_issue', with: Time.now
		fill_in 'po_number', with: '1'
		fill_in 'discount', with: '10'
		fill_in 'note', with: 'thank you for your business'
	end
end