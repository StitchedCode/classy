class CreateProject < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name, null: false
      t.integer :project_type, default: 0
      t.boolean :public, default: false
    end
  end
end
