require 'rails_helper'

describe Item do 
	describe 'relations' do
		it { is_expected.to belong_to :invoice }
		it { is_expected.to belong_to :item_kind }
	end

	describe 'fields' do
		it { is_expected.to have_fields(:qty, :kind, :description, :price, :total, :invoice_id, :item_kind_id)}
	end
end