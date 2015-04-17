class OrganisationsController < ApplicationController 
	def new
		@organisation = Organisation.new
	end
end