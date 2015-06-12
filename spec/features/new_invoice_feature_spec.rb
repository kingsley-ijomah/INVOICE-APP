require 'rails_helper'

feature Invoice do
	scenario 'visit invoice #new' do 
		visit invoices_path
		click_link 'Create Invoice'
		expect(current_path).to eq new_invoice_path
	end
 
	scenario 'valid invoice', js: true do
		client = create(:client)
		item_kind = create(:item_kind)
		@item_kind_name = item_kind.name
    @date = '06/09/2015 5:46 pm'
		@item_qty = 3
		@note = 'thank you for your business'
    @description = 'a month of coding'
    @terms = 'please pay on receipt'

		visit new_invoice_path

    click_link 'add_line'
    
    select client.first_name, from: 'invoice_client_id'
    fill_in 'invoice_date_of_issue', with: @date
    fill_in 'invoice_po_number', with: '88787'
    fill_in 'invoice_discount', with: '10'
    fill_in 'invoice_note', with: @note
    fill_in 'invoice_terms', with: @terms

    fill_in 'invoice_items_0_qty', with: @item_qty
    select @item_kind_name, from: 'invoice_items_0_item_kind_id'
    fill_in 'invoice_items_0_description', with: @description
    fill_in 'invoice_items_0_price', with: 3000

    click_button 'Save Draft'

    expect(current_path).to eq invoice_path(Invoice.last)
	end
end
