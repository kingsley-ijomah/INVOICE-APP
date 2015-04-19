require 'rails_helper'

describe Organisation do

  describe 'validation' do 
  	it { should validate_presence_of :name }
  	it { should validate_presence_of :street_1 }
  	it { should validate_presence_of :city }
  	it { should validate_presence_of :town }
  end

  describe 'relations' do
  	it { is_expected.to have_many(:clients).with_foreign_key(:organisation_id) }
  end
end
