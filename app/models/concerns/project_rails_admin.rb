# frozen_string_literal: true
module ProjectRailsAdmin
  extend ActiveSupport::Concern

  included do
    rails_admin do
      edit do
        configure :project_labels do
          associated_collection_scope do
            project = bindings[:object]
            ->(_scope) { project.project_labels }
          end
        end

        configure :texts do
          associated_collection_scope do
            project = bindings[:object]
            ->(_scope) { project.texts }
          end
        end

        exclude_fields :text_labels
      end

      list do
        field :name
        field :public
        field :texts do
          pretty_value do
            value.count
          end
        end
        field :users do
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
    end
  end
end
