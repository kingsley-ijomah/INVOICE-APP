require 'rails_helper'

describe InvoiceNumberHelper, type: :helper do
  describe '#generate_invoice_number' do
    context 'when no invoice exists in database' do
      it 'returns 00001 as first invoice' do
        expect(helper.generate_invoice_number).to eq (helper.invoice_prefix + '1')
      end
    end

    context 'when an invoice exists in database' do
      it 'should increment to 00002' do
        create(:invoice, number: 1)
        expect(helper.generate_invoice_number).to eq (helper.invoice_prefix + '2')
      end
    end
  end

  describe '#invoice_prefix' do
    it 'it add 0000 prefix to invoice' do
      expect(helper.invoice_prefix).to eq ('0000')
    end

    it 'adds invoice prefix to any number given' do
      expect(helper.add_invoice_prefix(13)).to eq '#000013'
    end
  end
end
