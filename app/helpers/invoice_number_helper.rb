module InvoiceNumberHelper
  def generate_invoice_number
    if Invoice.empty?
      '00001'
    else 
      n = Invoice.max(:number)
      '0000' + (n += 1).to_s
    end
  end
end
