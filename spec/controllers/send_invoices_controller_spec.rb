require 'rails_helper'

describe SendInvoicesController do 
  describe 'Get #new' do
    it 'assigns invoice to @invoice' do
      invoice = double('invoice', id: '1')
      allow(Invoice).to receive(:find).with(invoice.id).and_return(invoice)

      get 'new', invoice_id: invoice.id

      expect(Invoice).to have_received(:find).with(invoice.id)
      expect(assigns[:invoice]).to eq invoice
    end
  end
end
