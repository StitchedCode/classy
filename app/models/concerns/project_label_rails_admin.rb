module ProjectLabelRailsAdmin
  extend ActiveSupport::Concern

  included do
    rails_admin do
      list do
        field :project
        field :name
        field :text_labels do
          label 'Label count'
          pretty_value do
            value.count
          end
        end
      end

      edit do
        configure :texts do
          associated_collection_scope do
            project_label = bindings[:object]
            ->(_scope) { project_label.texts }
          end
        end
        exclude_fields :text_labels
      end
    end
  end
end
