	require 'rails_helper'

describe Invoice do 
	describe 'relations' do
		it { is_expected.to belong_to :organisation }
		it { is_expected.to belong_to :client }
		it { is_expected.to have_many :items }
	end

	describe 'fields' do
		it { is_expected.to have_fields(:number, :date_of_issue, :po_number, :discount, :note)}
	end

	describe 'validation' do 
  	it { should validate_presence_of :number }
  	it { should validate_presence_of :date_of_issue }
  end
end
