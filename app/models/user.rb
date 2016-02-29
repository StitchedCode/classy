# frozen_string_literal: true
class User < ActiveRecord::Base
  include UserRailsAdmin

  enum role: [:user, :admin]

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable,
         :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable

  # Allow user to change his password only when providing his current_password
  attr_accessor :current_password

  has_many :project_users
  has_many :projects, through: :project_users
  has_many :text_labels
  has_many :text, through: :text_labels

  def visible_projects
    admin? ? Project.all : projects + Project.public_projects
  end
end
