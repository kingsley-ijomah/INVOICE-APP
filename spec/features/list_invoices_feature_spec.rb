require 'rails_helper'

feature 'ListInvoices' do
  scenario 'no invoices in the database' do
    visit invoices_path
    expect(page.find('.empty_record')).to have_content('There are no saved invoices to show')
  end

  scenario 'invoices exists in database' do
    invoice = create(:invoice, number: 00001)
    5.times { create(:item, qty: 1, price: 2.50, invoice_id: invoice.id) }

    visit invoices_path
    expect(page.find('#invoice-table')).to have_content('00001')
    expect(page.find('#invoice-table')).to have_content(invoice.client.organisation.name)
    expect(page.find('#invoice-table')).to have_content(invoice.created_at.to_formatted_s(:long))
    expect(page.find('.invoice-total')).to have_content("%.2f" % invoice.reload.total)
  end

  scenario 'display invoice totals' do
    invoice_1 = create(:invoice)
    2.times { create(:item, qty: 1, price: 250, invoice_id: invoice_1.id) }

    invoice_2 = create(:invoice)
    2.times { create(:item, qty: 1, price: 250.40, invoice_id: invoice_2.id) }

    visit invoices_path

    expect(page.find('.invoice_totals')).to have_content('1,000.80')
  end

  scenario 'click view link' do
    invoice = create(:invoice, number: 00001)
    5.times { create(:item, qty: 1, price: 2.50, invoice_id: invoice.id) }

    visit invoices_path
    click_link('view')
    expect(current_path).to eq invoice_path(invoice.id)
  end

  scenario 'click edit link' do
    invoice = create(:invoice, number: 00001)
    5.times { create(:item, qty: 1, price: 2.50, invoice_id: invoice.id) }

    visit invoices_path
    click_link('edit')
    expect(current_path).to eq edit_invoice_path(invoice.id)
  end
end
