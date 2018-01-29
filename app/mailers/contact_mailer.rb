class ContactMailer < ApplicationMailer

  def mail_method(data, email, subject)
    @body = data
    mail(from: email, subject: subject)
  end

end
