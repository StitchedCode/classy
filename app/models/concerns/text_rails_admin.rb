# frozen_string_literal: true
module TextRailsAdmin
  extend ActiveSupport::Concern

  included do
    rails_admin do
      list do
        field :project
        field :name
        field :response_count do
          label 'Label count'
        end
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

      edit do
        configure :project_labels do
          associated_collection_scope do
            text = bindings[:object]
            ->(_scope) { text.project_labels }
          end
          inline_add false
        end
        exclude_fields :projects_labels, :text_labels, :users
      end
    end
  end
end
