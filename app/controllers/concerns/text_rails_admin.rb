module TextRailsAdmin
  extend ActiveSupport::Concern

  included do
    rails_admin do
      list do
        field :project
        field :name
        field :labelled?
        field :response_count
      end

      show do
        field :project
        field :body
        field :label
        field :label_counts
        field :user_labels
      end

      export do
        field :body
        field :label
      end
    end
  end
end