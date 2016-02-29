class RemoveColumnProjectTypeFromProjects < ActiveRecord::Migration
  def change
    remove_column :projects, :project_type, :integer
  end
end
