require 'rails_helper'

describe Client do 
	describe 'relations' do
		it { is_expected.to belong_to :organisation }
	end

	describe 'fields' do
		it { is_expected.to have_fields(:contact_type, :first_name, :last_name, :email, :tel, :note)}
	end

	describe 'validation' do 
  	it { should validate_presence_of :contact_type }
  	it { should validate_presence_of :first_name }
  	it { should validate_presence_of :last_name }
  	it { should validate_presence_of :email }
  	it { should validate_presence_of :tel }
  end
end