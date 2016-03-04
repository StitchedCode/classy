# frozen_string_literal: true
class Text < ActiveRecord::Base
  include TextRailsAdmin

  attr_reader :classification # used by simple_form

  belongs_to :project

  has_many :text_labels
  has_many :users, through: :text_labels
  has_many :project_labels, through: :project

  validates :body, presence: true

  scope :for, ->(user) { where(project_id: user.projects) }

  # XXX: If this proves too slow, let's do it with a SQL query
  def self.random_unlabelled_for(user)
    all.reject { |text| text.labelled_by?(user) }.sample
  end

  scope :public_texts, -> do
    references(:project).includes(:project).where(projects: { public: true })
  end

  # Only returns texts that have been labelled already
  scope :labelled, -> { joins(:text_labels) }

  def labelled?
    text_labels.present?
  end

  def labelled_by?(user)
    users.include?(user)
  end

  def label_counts
    project_labels.includes(:text_labels).map { |label| [label.name, label.text_labels.size] }.to_h
  end

  def label
    label, _count = label_counts.max_by { |_key, value| value }
    label
  end

  def user_labels
    text_labels.map { |label| [label.user.email, label.name] }.to_h
  end

  def response_count
    text_labels.count
  end
end
