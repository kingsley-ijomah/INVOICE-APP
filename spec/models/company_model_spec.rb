require 'rails_helper'

describe Company do

  describe 'validation' do 
  	it { should validate_presence_of :name }
  	it { should validate_presence_of :street_1 }
  	it { should validate_presence_of :city }
  	it { should validate_presence_of :town }
  end

  describe 'relations' do
  	it { is_expected.to have_many(:invoices).with_foreign_key(:company_id) }
  	it { is_expected.to have_many(:users).with_foreign_key(:company_id) }
  end
end
