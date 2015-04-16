require 'rails_helper'

feature 'Organisation' do
	scenario 'Valid organisation' do 
		visit new_client_path
		click_link '#create_new_organisation'
	end
end