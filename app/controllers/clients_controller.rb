class ClientsController < ApplicationController 
	def index
	end

	def new
		@client = Client.new
	end

	def create
		@client = Client.new(clients_params)
		if @client.save
			redirect_to clients_path
		else
			render 'new'
		end
	end

	def edit
	end

	def update
	end

	def destroy
	end

	private

	def clients_params
		params.require(:client).permit(:contact_type, :first_name, :last_name, :email, :tel, :note)
	end
end