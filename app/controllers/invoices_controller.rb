class InvoicesController < ApplicationController
  def index
  end

  def new
  	@invoice = Invoice.new
  end
end
