class InvoiceSettingsController < ApplicationController
	layout 'plain', :only => [:new]

  def new
    @invoice_settings = InvoiceSetting.new
  end

  def create
    @invoice_settings = InvoiceSetting.new(invoice_settings_params)
    InvoiceSetting.save(@invoice_settings)
  end

  def invoice_settings_params
    params.require(:invoice_settings).permit(:terms, :notes)
  end
end
