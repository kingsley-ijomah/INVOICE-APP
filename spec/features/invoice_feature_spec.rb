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
    fill_in 'invoice_number', with: '11'
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

    expect(page.find('.invoice_no')).to have_content(11)
		expect(page.find('.invoice_status')).to have_content('draft')
		expect(page.find('#invoice_number')).to have_content(11)
    expect(page.find('#invoice_date')).to have_content('06 Sep 17:46')
		expect(page.find('#po')).to have_content(88787)
    expect(page.find('.description')).to have_content(@description)
		expect(page.find('.item_qty')).to have_content(@item_qty)
		expect(page.find('.item_kind')).to have_content(@item_kind_name)
    expect(page).to have_content(@terms)
    
    expect(page.find('#company_name')).to have_content(Company.first.name)
    expect(page.find('#company_street_1')).to have_content(Company.first.street_1)
    expect(page.find('#company_street_2')).to have_content(Company.first.street_2)
    expect(page.find('#company_town')).to have_content(Company.first.town)
    expect(page.find('#company_city')).to have_content(Company.first.city)
    expect(page.find('#company_postcode')).to have_content(Company.first.post_code)
    
    expect(page.find('#org_name')).to have_content(Invoice.last.client.organisation.name)
    expect(page.find('#org_street_1')).to have_content(Invoice.last.client.organisation.street_1)
    expect(page.find('#org_street_2')).to have_content(Invoice.last.client.organisation.street_2)
    expect(page.find('#org_town')).to have_content(Invoice.last.client.organisation.town)
    expect(page.find('#org_city')).to have_content(Invoice.last.client.organisation.city)
    expect(page.find('#org_postcode')).to have_content(Invoice.last.client.organisation.post_code)
	end
end
