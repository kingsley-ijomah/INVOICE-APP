require 'rails_helper'

feature 'BreadCrums' do
  scenario 'visit new invoice page' do
    visit new_invoice_path
    expect(page.find('#crums-controller')).to have_content('Invoices')
    expect(page.find('.breadcrumb')).to have_content('Dashboard Invoices New')
  end
end
