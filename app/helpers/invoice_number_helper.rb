module InvoiceNumberHelper
  def invoice_prefix
    '0000'
  end

  def generate_invoice_number
    if Invoice.empty?
      invoice_prefix + '1'
    else 
      n = Invoice.max(:number)
      invoice_prefix + (n += 1).to_s
    end
  end
end
