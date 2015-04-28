require 'rails_helper'

describe ItemsController do 
	describe 'Get #new' do 
		it 'assigns instance of Item to @item and renders new.js.erb' do  
			xhr :get, :new, format: :js
			expect(assigns[:item]).to be_an_instance_of Item
			expect(response).to render_template('new')
		end
	end
end