require 'rails_helper'

feature 'Generate invoice number' do
  scenario 'with no invoice in database' do
    visit new_invoice_path
    expect(page).to have_field('invoice_number', with: '00001')
  end

  scenario 'with existing invoice in database' do
    create(:invoice, number: 00001)

    visit new_invoice_path
    expect(page).to have_field('invoice_number', with: '00002')
  end
end
