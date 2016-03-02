class Project < ActiveRecord::Base
  include ProjectRailsAdmin

  has_and_belongs_to_many :users

  has_many :project_labels
  has_many :text_labels, through: :project_labels
  has_many :texts

  validates :name, presence: true

  scope :public_projects, -> { where(public: true) }

  def users
    public? ? User.user : super
  end
end