require 'rails_helper'

feature 'View Invoice' do
	scenario 'valid invoice' do
    # lazy build other belongs_to objects
    item = create(:item)

    visit invoice_path(Invoice.first)

    @invoice = Invoice.first
    @item = Item.first
    @item_kind = ItemKind.first
    @company = Company.first
    @organisation = Organisation.first
    
    expect(page.find('.invoice_no')).to have_content(@invoice.number)
    expect(page.find('#invoice_number')).to have_content(@invoice.number)
    expect(page.find('#invoice_date')).to have_content(@invoice.date_of_issue.to_formatted_s(:long))
    expect(page.find('#po')).to have_content(@invoice.po_number)
     
    expect(page.find('.description')).to have_content(@item.description)
    expect(page.find('.item_qty')).to have_content(@item.qty)
		expect(page.find('.item_kind')).to have_content(@item_kind.name)
		expect(page.find('.item_price')).to have_content(@item.price)
    expect(page.find('.item_line_total')).to have_content("%.2f" % (@item.price * @item.qty))
    expect(page.find('#total')).to have_content("%.2f" % (@item.total))
    expect(page.find('#total-top')).to have_content("%.2f" % (@item.total))
    
    expect(page.find('#company_name')).to have_content(@company.name)
    expect(page.find('#company_street_1')).to have_content(@company.street_1)
    expect(page.find('#company_street_2')).to have_content(@company.street_2)
    expect(page.find('#company_town')).to have_content(@company.town)
    expect(page.find('#company_city')).to have_content(@company.city)
    expect(page.find('#company_postcode')).to have_content(@company.post_code)
    
    expect(page.find('#org_name')).to have_content(@organisation.name)
    expect(page.find('#org_street_1')).to have_content(@organisation.street_1)
    expect(page.find('#org_street_2')).to have_content(@organisation.street_2)
    expect(page.find('#org_town')).to have_content(@organisation.town)
    expect(page.find('#org_city')).to have_content(@organisation.city)
    expect(page.find('#org_postcode')).to have_content(@organisation.post_code)

    expect(page.find('#invoice_terms')).to have_content(@invoice.terms)
	end
end
