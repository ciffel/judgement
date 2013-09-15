ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.perform_deliveries = true
ActionMailer::Base.raise_delivery_errors = true
ActionMailer::Base.default_url_options[:host] = 'oj.sslab.cs.nthu.edu.tw'
ActionMailer::Base.smtp_settings = {
  :authentication => :plain,
  :address => "smtp.mailgun.org",
  :port => 587,
  :domain => ENV['MAILER_DOMAIN'],
  :user_name => ENV['MAILER_USER'],
  :password => ENV['MAILER_PASSWORD']
}