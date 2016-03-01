# frozen_string_literal: true
class PagesController < HighVoltage::PagesController
  skip_before_action :authenticate_user!
  skip_after_action :verify_authorized

  # Caching
  caches_page :robots

  # Respond
  layout false

  def robots
    robot_type = ENV["ALLOW_ROBOTS"] == "true" ? "allowed" : "disallowed"
    robots = File.read("#{Rails.root}/config/robots/robots.#{robot_type}.txt")
    render text: robots, layout: false, content_type: "text/plain"
  end

  def landing
  end

  def about
  end
end
