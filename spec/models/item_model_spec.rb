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
  end
end
