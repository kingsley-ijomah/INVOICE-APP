require 'rails_helper'
include SharedMockSpecHelper

describe ClientsController do 
	describe 'Get #index' do
		it 'assigns all clients to variable @client' do
			client = double('client')
			allow(Client).to receive(:all).and_return(client)

			get 'index'
			
			expect(assigns[:clients]).to eq client 
			expect(Client).to have_received(:all)
		end
	end

	describe 'Get #new' do 
		it 'assigns instance of client to @client' do  
			get 'new'
			expect(assigns[:client]).to be_an_instance_of Client
		end
	end

	describe 'Post #create' do 
		let(:double_client) { double('client') }

		it 'valid post' do
			attributes = attributes_for(:client)
			stub_new_save(model: Client, attributes: attributes, double: double_client, return_value: true)

			post 'create', client: attributes

			expect(response).to redirect_to clients_path
			spy_new_save(model: Client, attributes: attributes, double: double_client) 
		end

		it 'invalid post' do
			attributes = attributes_for(:client, first_name: nil)
			stub_new_save(model: Client, attributes: attributes, double: double_client, return_value: false)

			post 'create', client: attributes

			expect(response).to render_template 'new'
			spy_new_save(model: Client, attributes: attributes, double: double_client) 
		end
	end
end