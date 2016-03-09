# frozen_string_literal: true
class Upload < ActiveRecord::Base
  validates :project_name, :body, presence: true
end
