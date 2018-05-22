class ApplicationMailer < ActionMailer::Base
  default to: 'support@billybo.org'
  default from: 'robot@billybo.org'
  layout 'mailer'
end
