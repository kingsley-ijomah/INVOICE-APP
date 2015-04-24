require 'rails_helper'

RSpec.describe InvoicesController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
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

end
