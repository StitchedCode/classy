# frozen_string_literal: true
require 'bundler'
Bundler.setup

if Rails.env.development?
  require 'derailed_benchmarks'
  require 'derailed_benchmarks/tasks'
end
