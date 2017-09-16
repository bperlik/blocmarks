ActionMailer::Base.smtp_settings = {
  port:              587,
  address:           'smtp.mailgun.org',
  user_name:         ENV['MAILGUN_SMTP_LOGIN'],
  password:          ENV['MAILGUN_SMTP_PASSWORD'],
  domain:            'blocmarks-bp.herokuapp.com',
  authentication:    :plain,
  content_type:      'text/html'
}
ActionMailer::Base.delivery_method = :smtp

# Makes debugging *way* easier.
ActionMailer::Base.raise_delivery_errors = true

# This interceptor just makes sure that local mail
# only emails you.
# http://edgeguides.rubyonrails.org/action_mailer_basics.html#intercepting-emails
class DevelopmentMailInterceptor
  def self.delivering_email(message)
<<<<<<< HEAD
    message.to =  'barbperlik@gmail.com'
    message.cc = nil
=======
    message.to = 'postmaster@sandbox163c134798404e'
    message.cc = 'barbperlik@gmail.com'
>>>>>>> 6e096c01d619561abc21f0e6aa085d873177d2bf
    message.bcc = nil
  end
end

# Locally, outgoing mail will be 'intercepted' by the
# above DevelopmentMailInterceptor before going out
if Rails.env.development?
  ActionMailer::Base.register_interceptor(DevelopmentMailInterceptor)
end
<<<<<<< HEAD
=======

>>>>>>> 6e096c01d619561abc21f0e6aa085d873177d2bf
