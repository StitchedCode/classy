class CreateTextLabels < ActiveRecord::Migration
  def change
    create_table :text_labels do |t|
      t.belongs_to :text, index: true, foreign_key: true
      t.belongs_to :project_label, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
