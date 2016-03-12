# Failure backends
require 'resque-retry'
require 'resque/failure/redis'
require 'resque-sentry'
require 'resque/scheduler/tasks'
Resque.redis = ENV['REDIS_URL'] # foreman needed this else it was hitting 127.0.0.1

Dir["#{Rails.root}/app/jobs/*.rb"].each { |file| require file }
Dir["#{Rails.root}/app/jobs/**/*.rb"].each { |file| require file }

# logging
if Rails.env.development?
  Resque.logger = Rails.logger
  Resque.logger.level = Logger::DEBUG
else
  Resque::Failure::Sentry.logger = 'resque'
  Resque::Failure::MultipleWithRetrySuppression.classes = [Resque::Failure::Redis, Resque::Failure::Sentry]
  Resque::Failure.backend = Resque::Failure::MultipleWithRetrySuppression
end
