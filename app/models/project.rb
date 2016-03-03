# frozen_string_literal: true
class Project < ActiveRecord::Base
  include ProjectRailsAdmin

  has_and_belongs_to_many :users
  has_many :project_labels
  has_many :text_labels, through: :project_labels
  has_many :texts

  validates :name, presence: true

  after_create :create_default_labels

  scope :public_projects, -> { where(public: true) }

  def users
    public? ? User.user : super
  end

  private

  def create_default_labels
    project_labels.create(name: "I don't know")
    project_labels.create(name: 'None of the above')
  end
end
