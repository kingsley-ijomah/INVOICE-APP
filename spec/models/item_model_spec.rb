require 'rails_helper'

describe Item do 
	describe 'relations' do
		it { is_expected.to belong_to :invoice }
		it { is_expected.to belong_to :item_kind }
	end

	describe 'fields' do
		it { is_expected.to have_fields(:qty, :description, :price, :total, :invoice_id, :item_kind_id)}
	end

	describe '#index_increment method' do
		it 'result should increase with each call' do
			count = Item.index_increment
			expect(Item.index_increment).to eq count + 1
			expect(Item.index_increment).to eq count + 2
			expect(Item.index_increment).to eq count + 3
		end
	end

  describe '#update_total' do
    it 'multiply qty by price to get total' do
      item = create(:item, price: 700.60, qty: 2)
      expect(item.total).to eq (700.60 * 2)
    end

    it 'reset total after update' do
      item = create(:item, price: 2.50, qty: 1)
      item.qty = 2
      item.save
      expect(item.total).to eq (2.50 * 2)
    end

    it 'gets totals for invoice' do
      item_1 = create(:item, price: 2.50, qty: 1)
      item_2 = create(:item, price: 2.50, qty: 1, invoice_id: item_1.invoice.id)
      
      expect(item_2.invoice.calculate_items_totals).to eq (5.00)
    end
  end
end
