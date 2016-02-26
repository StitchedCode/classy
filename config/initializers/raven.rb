if Rails.env.production?
  Raven.configure do |c|
    c.server_name = ENV['SENTRY_SERVER_NAME'] if ENV['SENTRY_SERVER_NAME']
  end
end
