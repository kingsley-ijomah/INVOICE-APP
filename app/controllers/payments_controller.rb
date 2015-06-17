class PaymentsController < ApplicationController
  layout 'plain', :only => [:new]

  def new
    @invoice = Invoice.find(params[:invoice_id])
    @payment = Payment.new(invoice: @invoice)
  end

  def create
    @payment = Payment.new(payments_params)
    if @payment.save
      redirect_to invoice_path(params[:invoice_id])
    else
      render 'new'
    end
  end

  private
  def payments_params
    params.require(:payment).permit(:amount, :date, :note).merge(invoice_id: params[:invoice_id])
  end    
end
