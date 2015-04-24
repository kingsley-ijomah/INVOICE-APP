require 'rails_helper'

feature Invoice do
	scenario 'visit invoice #new' do 
		visit invoices_path
		click_link 'Create Invoice'
		expect(current_path).to eq new_invoice_path
	end

	scenario 'valid invoice' do 
		client = create(:client)

		visit new_invoice_path
		expect {
			select client.first_name, from: 'invoice_client_id'
			fill_in 'invoice_number', with: '11'
			fill_in 'invoice_date_of_issue', with: Time.now
			fill_in 'invoice_po_number', with: '1'
			fill_in 'invoice_discount', with: '10'
			fill_in 'invoice_note', with: 'thank you for your business'
			click_button 'Save Draft'
		}.to change(Invoice, :count).by(1)
	end
end