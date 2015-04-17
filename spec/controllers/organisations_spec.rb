require 'rails_helper'

describe OrganisationsController do 
	describe 'Get #new' do
		it 'sets @organisation instance variable' do
			get 'new'
			expect(assigns[:organisation]).to_not be_nil
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
			stub_new_save(attributes: attributes, double: double_org, return_value: true)

			post 'create', organisation: attributes

			expect(response).to redirect_to 'index'
			spy_new_save(attributes: attributes, double: double_org) 
		end

		it 'invalid post' do
			attributes = attributes_for(:organisation, name: nil)
			stub_new_save(attributes: attributes, double: double_org, return_value: false)

			post 'create', organisation: attributes

			expect(response).to render_template 'new'
			spy_new_save(attributes: attributes, double: double_org) 
		end
	end
end

def stub_new_save(attributes:, double:, return_value:)
	allow(Organisation).to receive(:new).with(attributes).and_return(double)
	allow(double).to receive(:save).and_return(return_value)
end

def spy_new_save(attributes:, double:) 
	expect(Organisation).to have_received(:new).with(attributes)
	expect(double).to have_received(:save)
end