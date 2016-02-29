module UserRailsAdmin
  extend ActiveSupport::Concern

  included do
    rails_admin do
      object_label_method :email
    end
  end
end