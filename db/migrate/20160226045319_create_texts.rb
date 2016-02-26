class CreateTexts < ActiveRecord::Migration
  def change
    create_table :texts do |t|
      t.belongs_to :project
      t.text :body, null: false

      t.timestamps null: false
    end
  end
end
