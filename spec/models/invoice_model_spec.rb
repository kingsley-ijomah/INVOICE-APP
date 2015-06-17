require 'rails_helper'

describe Invoice do 
  describe 'relations' do
    it { is_expected.to belong_to :organisation }
    it { is_expected.to belong_to :client }
    it { is_expected.to have_many :items }
    it { is_expected.to have_many :payments }
  end

  describe 'fields' do
    it { is_expected.to have_fields(:number, :date_of_issue, :po_number, :discount, :note, :terms, :total)}
  end

  describe 'validation' do 
    it { should validate_presence_of :number }
    it { should validate_presence_of :date_of_issue }
    it { should validate_presence_of :terms }
  end

  describe '#calculate_items_totals' do
    it 'calculate multiple row totals' do
      @invoice = create(:invoice)
      item_1 = create(:item, qty: 1, price: 2.50, invoice_id: @invoice.id)
      item_2 = create(:item, qty: 1, price: 2.75, invoice_id: @invoice.id)

      expect(@invoice.reload.calculate_items_totals).to eq (item_1.total + item_2.total)
    end
  end

  describe '#update_total' do
    it 'updates invoice total when you add new item' do
      @invoice = create(:invoice)
      item_1 = create(:item, qty: 1, price: 2.50, invoice_id: @invoice.id)
      item_2 = create(:item, qty: 1, price: 2.75, invoice_id: @invoice.id)

      expect(@invoice.reload.total).to eq (item_1.total + item_2.total)
    end
  end

  describe '#invoice_totals' do
    it 'calculates the total for all invoices' do
      invoice_1 = create(:invoice)
      invoice_2 = create(:invoice)

      2.times { create(:item, qty: 1, price: 250, invoice_id: invoice_1.id) }
      2.times { create(:item, qty: 1, price: 250, invoice_id: invoice_2.id) }

      expect(Invoice.total).to eq 1000.0
    end
  end

  describe 'calculate paid and due totals' do
    before(:each) do
      @invoice = create(:invoice)
      10.times { create(:item, invoice_id: @invoice.id, qty: 1, price: 100) } # £1,000.00
      2.times { create(:payment, invoice_id: @invoice.id, amount: 250.00) } # £500.00
    end

    describe '#total_amount_paid' do
      it 'calculates total amount paid' do
        expect(@invoice.total_amount_paid).to eq(500.00)
      end
    end

    describe '#total_amount_due' do
      it 'calculates total amount due' do
        expect(@invoice.reload.total_amount_due).to eq 500.00
      end
    end
  end

end

















