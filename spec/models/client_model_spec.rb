require 'rails_helper'

describe Client do 
	describe 'relations' do
		it { is_expected.to belong_to :organisation }
	end

	describe 'fields' do
		it { is_expected.to have_fields(:contact_type, :first_name, :last_name, :email, :tel, :note)}
	end
end