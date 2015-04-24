class InvoicesController < ApplicationController
  def index
  end

  def new
  	@invoice = Invoice.new
  end

  def create
  	@invoice = Invoice.new(invoice_params)
  	if @invoice.save
  		redirect_to invoices_path
  	else
  		render 'new'
  	end
  end

  private

  def invoice_params
  	params.require(:invoice).permit(:client_id, :organisation_id, :number, :date_of_issue, :po_number, :discount, :note)
  end
end