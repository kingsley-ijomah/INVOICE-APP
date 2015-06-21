class InvoiceMailer < ApplicationMailer
  default from: 'kingsley.ijomah@gmail.com'
  helper :application, :invoice_number

  def send_invoice_email(client:, invoice:)
    @client = client
    @invoice = invoice

    mail(to: @client.email, subject: 'Invoice from KOCO')
  end
end
