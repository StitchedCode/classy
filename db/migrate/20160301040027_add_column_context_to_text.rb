class AddColumnContextToText < ActiveRecord::Migration
  def change
    add_column :texts, :context, :text
  end
end
