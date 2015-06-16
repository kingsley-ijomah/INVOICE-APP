require 'rails_helper'

describe Payment do 
	describe 'relations' do
		it { is_expected.to belong_to :invoice }
	end

	describe 'fields' do
		it { is_expected.to have_fields(:amount, :date, :note)}
	end

	describe 'validation' do 
  	it { should validate_presence_of :amount }
  	it { should validate_presence_of :date }
  end
end

