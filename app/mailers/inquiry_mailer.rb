class InquiryMailer < ApplicationMailer
  def send_mail(inquiry)
    @inquiry = inquiry
    mail(
      subject: 'お問い合わせ通知',
      to: 'adminer@example.com',
      from: 'system@example.com'
    )
  end
end