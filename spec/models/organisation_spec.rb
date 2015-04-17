require 'rails_helper'

RSpec.describe Organisation, type: :model do
  describe 'validation' do 
  	it { should validate_presence_of :name }
  	it { should validate_presence_of :street_1 }
  	it { should validate_presence_of :city }
  	it { should validate_presence_of :town }
  end
end
