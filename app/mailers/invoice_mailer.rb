class InvoiceMailer < ApplicationMailer
  default from: 'kingsley.ijomah@gmail.com'

  def send_invoice_email(client:, invoice:)
    @client = client
    @invoice = invoice

    mail(to: @client.email, subject: 'Invoice from KOCO')
  end
end
