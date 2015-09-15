class InvoiceSettingsController < ApplicationController
  layout 'plain'

  def new
    @invoice_setting = InvoiceSetting.new
  end

  def create
    @invoice_setting = InvoiceSetting.new(invoice_settings_params)
    respond_to do |format|
      if !InvoiceSetting.first.nil?
        InvoiceSetting.first.update(invoice_settings_params)
        format.js
      else 
        if @invoice_setting.save
          format.js
          # format.html { redirect_to(@invoice_setting, :notice => 'Article was successfully created.') }
          # format.xml  { render :xml => @invoice_setting, :status => :created, :location => @invoice_setting }
        else
          # format.html { render :action => "new" }
          # format.xml  { render :xml => @invoice_setting.errors, :status => :unprocessable_entity }
          format.js
        end
      end
    end
  end

  def invoice_settings_params
    params.require(:invoice_setting).permit(:terms, :notes)
  end
end
