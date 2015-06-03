require 'rails_helper'

describe User do 
	context 'validation' do 
		it { should validate_presence_of :name }
		it { should validate_presence_of :email }
		it { should validate_presence_of :company_id }
	end

  context 'relations' do
    it { is_expected.to belong_to :company }
  end

  context 'fields' do
    it { is_expected.to have_fields(:name, :email, :encrypted_password, :company_id) }
  end
end
