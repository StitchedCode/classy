module ProjectRailsAdmin
  extend ActiveSupport::Concern

  included do
    rails_admin do
      update do
        exclude_fields :text_labels
      end
    end
  end
end