	require 'rails_helper'

describe Invoice do 
	describe 'relations' do
		it { is_expected.to belong_to :organisation }
		it { is_expected.to belong_to :client }
		it { is_expected.to have_many :items }
	end

	describe 'fields' do
		it { is_expected.to have_fields(:number, :date_of_issue, :po_number, :discount, :note, :terms, :total)}
	end

	describe 'validation' do 
  	it { should validate_presence_of :number }
  	it { should validate_presence_of :date_of_issue }
  	it { should validate_presence_of :terms }
  end

  describe '#total' do
    it 'calculate multiple row totals' do
      item_1 = create(:item, qty: 1, price: 2.50)
      item_2 = create(:item, qty: 1, price: 2.75, invoice_id: item_1.invoice.id)
     
      expect(item_2.invoice.total).to eq (item_1.total + item_2.total) 
    end
  end
end
