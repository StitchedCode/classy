# frozen_string_literal: true
module UserRailsAdmin
  extend ActiveSupport::Concern

  included do
    rails_admin do
      object_label_method do
        :email
      end

      list do
        field :email
        field :role
        field :last_sign_in_at
        field :projects do
          label 'Project count'
          pretty_value do
            value.count
          end
        end
        field :text_labels do
          label 'Label count'
          pretty_value do
            value.count
          end
        end
      end

      edit do
        field :password
        field :password_confirmation
        field :role
        field :projects
      end
    end
  end
end
