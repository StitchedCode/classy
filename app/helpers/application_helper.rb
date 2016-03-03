# frozen_string_literal: true
module ApplicationHelper
  ALERT_TYPES = %i(success info warning danger).freeze unless const_defined?(:ALERT_TYPES)

  def title(title = nil)
    content_for(:title, title_text(title))
  end

  def title_text(title = nil)
    title ||= action_name.titleize
    "Classy — #{title}"
  end

  def bootstrap_flash(options = {})
    flash_messages = []
    flash.each do |type, message|
      # Skip empty messages, e.g. for devise messages set to nothing in a locale file.
      next if message.blank?

      type = flash_type(type)
      next unless ALERT_TYPES.include?(type)

      Array(message).each do |msg|
        text = flash_text(type, options[:class], msg)
        flash_messages << text if msg
      end
    end
    return unless flash_messages.any?
    content_tag(:div, flash_messages.join("\n").html_safe)
  end

  private

  def flash_type(type)
    case (type = type.to_sym)
    when :notice then :success
    when :alert  then :danger
    when :error  then :danger
    else type
    end
  end

  def flash_text(type, klass, msg)
    content_tag(:div, class: "alert fade in alert-#{type} #{klass}") do
      content_tag(:div, class: 'container') do
        content_tag(:button, raw('&times;'), class: 'close', 'data-dismiss' => 'alert') + msg
      end
    end
  end
end
