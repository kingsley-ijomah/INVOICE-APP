require 'rails_helper'

describe InvoiceNumberHelper, type: :helper do
  describe '#generate_invoice_number' do
    context 'when no invoice exists in database' do
      it 'returns 00001 as first invoice' do
        expect(helper.generate_invoice_number).to eq '00001'
      end
    end

    context 'when an invoice exists in database' do
      it 'should increment to 00002' do
        create(:invoice, number: 1)
        expect(helper.generate_invoice_number).to eq '00002'
      end
    end
  end
end
