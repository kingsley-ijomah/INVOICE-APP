class OrganisationsController < ApplicationController 
	layout 'plain', :only => [:new]

	def new
		@organisation = Organisation.new
	end

	def create
		@organisation = Organisation.new(organisation_params)
		if @organisation.save
			redirect_to new_client_path
		else
			render 'new'
		end
	end

	private

	def organisation_params
		params.require(:organisation).permit(:name, :street_1, :street_2, :city, :town, :post_code)
	end
end