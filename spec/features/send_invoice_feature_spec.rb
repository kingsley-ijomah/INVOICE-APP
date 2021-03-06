require 'rails_helper'

feature 'SendInvoice' do
  scenario 'send invoice to client' do
    invoice = create(:invoice) 
    create(:item, invoice_id: invoice.id, qty: 1, price: 1000.00)
    org = invoice.client.organisation

    visit invoice_path(invoice.id)
    click_link 'Send Invoice'

    expect(page.find('#company')).to have_content(org.name)
    expect(page.find('#invoice_no')).to have_content(invoice.number)

    click_button 'Confirm'

    expect(page.find('.alert')).to have_content('You have successfully sent invoice #0000' + invoice.number.to_s + ' to ' + org.name)
  end  
end
