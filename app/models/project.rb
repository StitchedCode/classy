class Project < ActiveRecord::Base
  include ProjectRailsAdmin

  has_many :project_labels
  has_many :text_labels, through: :project_labels
  has_many :project_users
  has_many :texts

  validates :name, presence: true

  scope :public_projects, -> { where(public: true) }

  def self.users
    public? ? User.user.all : ProjectUser.all
  end
end