class AddUserIdToTextLabel < ActiveRecord::Migration
  def change
    add_column :text_labels, :user_id, :integer
  end
end
