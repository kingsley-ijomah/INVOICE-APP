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

  def add_invoice_prefix(n)
    '#' + invoice_prefix + n.to_s
  end
end
