class SendInvoicesController < ApplicationController
  layout 'plain'

  def new
    @invoice = Invoice.find(params[:invoice_id])
  end 

  def create
    @invoice = Invoice.find params[:invoice_id]
    @client = @invoice.client
    InvoiceMailer.send_invoice_email(client: @client, invoice: @invoice).deliver_now
    redirect_to @invoice, notice: 'You have successfully sent invoice #0000' + @invoice.number.to_s + ' to ' + @client.organisation.name 
  end
end
