Devise::Async.setup do |config|
  config.enabled = false
  config.backend = :resque
  config.queue   = :mailer
end