require 'rails_helper'

feature Payment do
  scenario 'Successfully enter payment' do
    invoice = create(:invoice)
    5.times { create(:item, invoice_id: invoice.id) }

    visit invoice_path(invoice.id)

    click_link 'Enter Payment'

    expect(page.find('#panel-title')).to have_content('#0000' + invoice.number.to_s)
    expect(page.find('#amount')).to have_content(invoice.total)

    expect {
      fill_in 'payment_amount', with: 600.50
      fill_in 'payment_date', with: DateTime.now.beginning_of_day
      fill_in 'payment_note', with: Faker::Lorem.sentence
      click_button 'Save Payment'
    }.to change(Payment, :count).by(1)
  end
end
