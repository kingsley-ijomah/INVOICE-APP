require 'rails_helper'

feature Invoice do
	scenario 'valid invoice' do 
		client = create(:client)

		visit new_invoice_path
		select client.first_name, from: 'invoice_client_id'
		fill_in 'invoice_number', with: '11'
		fill_in 'invoice_date_of_issue', with: Time.now
		fill_in 'invoice_po_number', with: '1'
		fill_in 'invoice_discount', with: '10'
		fill_in 'invoice_note', with: 'thank you for your business'
	end
end