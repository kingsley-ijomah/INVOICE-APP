require 'rails_helper'

feature 'ListInvoices' do
  scenario 'no invoices in the database' do
    visit invoices_path
    expect(page.find('.empty_record')).to have_content('There are no saved invoices to show')
  end

  scenario 'invoices exists in database' do
    record = create(:invoice, number: 00001)

    visit invoices_path
    expect(page.find('#invoice-table')).to have_content('00001')
    expect(page.find('#invoice-table')).to have_content(record.client.organisation.name)
    expect(page.find('#invoice-table')).to have_content(record.created_at.to_formatted_s(:long))
  end
end
