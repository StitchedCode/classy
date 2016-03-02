class ProjectLabel < ActiveRecord::Base
  include ProjectLabelRailsAdmin

  belongs_to :project

  has_many :text_labels
  has_many :texts, through: :text_labels

  validates :name, presence: true
end
