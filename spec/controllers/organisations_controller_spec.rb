require 'rails_helper'
include SharedMockSpecHelper

describe OrganisationsController do 
	describe 'Get #new' do
		it 'sets @organisation instance variable' do
			get 'new'
			expect(assigns[:organisation]).to be_an_instance_of Organisation
		end

		it 'checks that render method was called' do
			get 'new'
			expect(response).to render_template(:layout => 'plain')
		end
	end

	describe 'Post #create' do
		let(:double_org) { double('organisation') }

		it 'valid post' do
			attributes = attributes_for(:organisation)
			stub_new_save(model: Organisation, attributes: attributes, double: double_org, return_value: true)

			post 'create', organisation: attributes

			expect(response).to redirect_to new_client_path
			spy_new_save(model: Organisation, attributes: attributes, double: double_org) 
		end

		it 'invalid post' do
			attributes = attributes_for(:organisation, name: nil)
			stub_new_save(model: Organisation, attributes: attributes, double: double_org, return_value: false)

			post 'create', organisation: attributes

			expect(response).to render_template 'new'
			spy_new_save(model: Organisation, attributes: attributes, double: double_org) 
		end
	end
end