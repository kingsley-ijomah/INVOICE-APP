require 'rails_helper'

describe ButtonStateHelper, type: :helper do
  describe '#set_active_if_current' do
   context 'returns active' do 
     it 'returns string active' do
       params[:controller] = 'dashboard'
       expect(helper.set_active_if_current controller: 'dashboard').to eq 'active'
     end

     it 'returns nil' do
       params[:controller] = 'clients'
       expect(helper.set_active_if_current controller: 'dashboard').to eq nil
     end
   end
  end
end
