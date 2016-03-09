class AddButtonOptionToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :option_buttons, :boolean, default: false
  end
end
