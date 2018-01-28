class ApplicationMailer < ActionMailer::Base
  default from: Site.first.support_email
  layout 'mailer'
end
