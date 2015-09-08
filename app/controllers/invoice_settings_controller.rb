class InvoiceSettingsController < ApplicationController
	layout 'plain', :only => [:new]

  def new
    @invoice_settings = InvoiceSetting.new
  end
end
