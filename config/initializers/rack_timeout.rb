# See: https://devcenter.heroku.com/articles/request-timeout
if defined?(Rack::Timeout)
  Rack::Timeout.timeout = Integer(ENV["WEB_TIMEOUT"] || 25)
  # Don't log state changes. Comment out the following line if you want them.
  Rack::Timeout.unregister_state_change_observer(:logger)
end
