require 'rails_helper'

describe ClientsController do 
	describe 'assigns Client.new to @client' do 
		it 'Get #new' do  
			get 'new'
			expect(assigns[:client]).to be_an_instance_of Client
		end
	end
end