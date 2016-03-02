module TextLabelRailsAdmin
  extend ActiveSupport::Concern

  included do
    rails_admin do
      list do
        field :project
        field :text
        field :user
        field :name
      end
    end
  end
end
