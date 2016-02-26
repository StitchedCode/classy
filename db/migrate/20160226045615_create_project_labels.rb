class CreateProjectLabels < ActiveRecord::Migration
  def change
    create_table :project_labels do |t|
      t.belongs_to :project
      t.string :name, null: false, index: true
      t.timestamps null: false
    end
  end
end
