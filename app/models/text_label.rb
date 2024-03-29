# frozen_string_literal: true
class TextLabel < ActiveRecord::Base
  include TextLabelRailsAdmin

  belongs_to :text
  belongs_to :project_label
  belongs_to :user
  has_one :project, through: :project_label

  delegate :name, to: :project_label, prefix: false, nil: false
end
