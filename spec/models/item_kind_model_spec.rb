require 'rails_helper'

describe ItemKind do 
	describe 'relations' do
		it { is_expected.to have_many :items }
	end

	describe 'fields' do
		it { is_expected.to have_fields(:name)}
	end
end