require 'rails_helper'

describe PaymentsController do
  describe '#new' do
    it 'assigns instance of payment to @payment' do  
      invoice = double('invoice', id: "1")
      payment = double('payment')
      allow(Invoice).to receive(:find).with(invoice.id).and_return(invoice)      
      allow(Payment).to receive(:new).with(invoice: invoice).and_return(payment)

      get 'new', invoice_id: invoice.id

      expect(Invoice).to have_received(:find).with(invoice.id)
      expect(Payment).to have_received(:new).with(invoice: invoice)

      expect(assigns[:payment]).to eq payment
      expect(assigns[:invoice]).to eq invoice
    end
  end

  describe 'Post #create' do
    it 'valid post' do
      invoice = double('invoice', id: '1')
      payment = double('payment')
      attributes = attributes_for(:payment)

      allow(Payment).to receive(:new).with(attributes.merge(invoice_id: invoice.id)).and_return(payment)
      allow(payment).to receive(:save).and_return(true)

      post 'create', invoice_id: invoice.id, payment: attributes

      expect(Payment).to have_received(:new).with(attributes.merge(invoice_id: invoice.id))
      expect(payment).to have_received(:save)
      expect(response).to redirect_to invoices_url
    end

    it 'invalid post' do
      invoice = double('invoice', id: '1')
      payment = double('payment')
      attributes = attributes_for(:payment)

      allow(Payment).to receive(:new).with(attributes.merge(invoice_id: invoice.id)).and_return(payment)
      allow(payment).to receive(:save).and_return(false)

      post 'create', invoice_id: invoice.id, payment: attributes

      expect(Payment).to have_received(:new).with(attributes.merge(invoice_id: invoice.id))
      expect(payment).to have_received(:save)
      expect(response).to render_template 'new'
    end
  end
end
