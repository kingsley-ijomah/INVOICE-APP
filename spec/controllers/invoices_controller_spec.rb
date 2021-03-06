require 'rails_helper'
include SharedMockSpecHelper

RSpec.describe InvoicesController, type: :controller do
  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "assings paginated object to @invoices" do
      invoice = double('invoice')
      allow(Invoice).to receive(:all).and_return(invoice)
      allow(invoice).to receive(:page).and_return(invoice)

      get :index

      expect(Invoice).to have_received(:all)
      expect(invoice).to have_received(:page)
      expect(assigns[:invoices]).to eq invoice
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end

    it "assings Invoice.new to @invoice" do
      get :new
      expect(assigns[:invoice]).to be_an_instance_of Invoice
    end
  end

  describe "POST #create" do 
    let(:double_invoice) { double('invoice') }

    it 'valid post' do
      attributes = attributes_for(:invoice)
      stub_new_save(model: Invoice, attributes: attributes, double: double_invoice, return_value: true)

      post 'create', invoice: attributes

      expect(response).to redirect_to invoice_path(double_invoice)
      spy_new_save(model: Invoice, attributes: attributes, double: double_invoice) 
    end

    it 'invalid post' do
      attributes = attributes_for(:invoice, number: nil)
      stub_new_save(model: Invoice, attributes: attributes, double: double_invoice, return_value: false)

      post 'create', invoice: attributes

      expect(response).to render_template 'new'
      spy_new_save(model: Invoice, attributes: attributes, double: double_invoice) 
    end
  end
end
