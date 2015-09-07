class InvoiceSettingsController < ApplicationController
  def new
    @invoice_settings = InvoiceSetting.new
  end
end
