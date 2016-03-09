class CreateUploads < ActiveRecord::Migration
  def change
    create_table :uploads do |t|
      t.string :project_name, null: false
      t.json :body, null: false

      t.timestamps null: false
    end
  end
end
