class InvoicesController < ApplicationController
  def index
		@invoices = Invoice.all.page params[:page]
  end

  def new
  	@invoice = Invoice.new
    @invoice_setting = InvoiceSetting.first || begin 
      OpenStruct.new(terms:nil, notes:nil)
    end
  end

  def create
  	@invoice = Invoice.new(invoice_params)

  	if @invoice.save
      redirect_to invoice_url(@invoice)
  	else
  		render 'new'
  	end
  end

  def edit
    @invoice = Invoice.find(params[:id])
    # change format so calendar can pre-populate
    @invoice.format_date
  end

  def update
    @invoice = Invoice.find(params[:id])
    if @invoice.update(invoice_params)
      redirect_to invoice_url(@invoice)
    else
      render 'edit'
    end
  end

  def show
    @invoice = Invoice.find(params[:id])
  end

  def destroy
    @invoice = Invoice.find(params[:id])
    @invoice.destroy

    redirect_to invoices_path
  end

  private

  def invoice_params
  	params.require(:invoice).permit(
      :id,
      :client_id, 
      :organisation_id, 
      :number, 
      :date_of_issue, 
      :po_number, 
      :discount, 
      :note,
      :terms,
      {items: [:qty, :description, :item_kind_id, :price]}
    )
  end
end
