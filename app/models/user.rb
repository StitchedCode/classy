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

  has_and_belongs_to_many :projects
  has_many :text_labels
  has_many :texts, through: :text_labels
end
