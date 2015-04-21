require 'rails_helper'
include SharedMockSpecHelper

describe ClientsController do 
	describe 'Get #index' do
		it 'assigns all clients to variable @client' do
			client = double('client')
			allow(client).to receive(:page).and_return(client)
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

	describe 'Get #edit' do 
		it 'assigns client to @client' do 
			@client = create(:client)

			client = double('client')
			allow(Client).to receive(:find).with(@client.id).and_return(client)

			get 'edit', id: @client.id

			expect(Client).to have_received(:find).with(@client.id)
			expect(assigns[:client]).to eq client
		end
	end

	describe 'Patch #update' do 
		let(:created_client) { create(:client) }
		let(:client_attributes) { attributes_for(:client, first_name: 'james', last_name: 'bond') }
		let(:client_double) { client_double = double('client') }

		it 'valid update' do 
			stub_find_update(model: Client, id: created_client.id, attributes: client_attributes, double: client_double, return_value: true)

			patch 'update', id: created_client.id, client: client_attributes

			spy_find_update(model: Client, id: created_client.id, attributes: client_attributes, double: client_double)
			expect(response).to redirect_to clients_path
		end

		it 'invalid update' do 
			stub_find_update(model: Client, id: created_client.id, attributes: client_attributes, double: client_double, return_value: false)

			patch 'update', id: created_client.id, client: client_attributes

			spy_find_update(model: Client, id: created_client.id, attributes: client_attributes, double: client_double)
			expect(response).to render_template 'edit'
		end
	end
end