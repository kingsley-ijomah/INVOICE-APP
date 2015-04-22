class ClientsController < ApplicationController 
	def index
		@clients = Client.all.page params[:page]
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
		@client = Client.find(params[:id])
	end

	def update
		@client = Client.find(params[:id])
		
		if @client.update(clients_params)
			redirect_to clients_path
		else
			render 'edit'
		end
	end

	def show
	end

	def destroy
		@client = Client.find(params[:id])
		@client.destroy

		redirect_to clients_path
	end

	private

	def clients_params
		params.require(:client).permit(:organisation_id, :contact_type, :first_name, :last_name, :email, :tel, :note)
	end
end