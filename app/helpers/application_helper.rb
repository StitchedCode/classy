# frozen_string_literal: true
module ApplicationHelper
  ALERT_TYPES = %i(success info warning danger).freeze unless const_defined?(:ALERT_TYPES)

  def title(title = nil)
    content_for(:title, title_text(title))
  end

  def title_text(title = nil)
    title ||= action_name.titleize
    "Rails Template — #{title}"
  end

  def bootstrap_flash(options = {})
    flash_messages = []
    flash.each do |type, message|
      # Skip empty messages, e.g. for devise
      # messages set to nothing in a locale file.
      next if message.blank?

      type = type.to_sym
      type = :success if type == :notice
      type = :danger  if type == :alert
      type = :danger  if type == :error
      next unless ALERT_TYPES.include?(type)

      Array(message).each do |msg|
        text = content_tag(:div, class: "alert fade in alert-#{type} #{options[:class]}") do
          content_tag(:div, class: "container") do
            content_tag(:button, raw("&times;"), class: "close", "data-dismiss" => "alert") + msg
          end
        end
        flash_messages << text if msg
      end
    end
    return unless flash_messages.any?
    content_tag(:div, flash_messages.join("\n").html_safe)
  end
end
