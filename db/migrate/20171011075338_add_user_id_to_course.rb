class AddUserIdToCourse < ActiveRecord::Migration[5.0]
  def change
    add_column :courses, :user_id, :integer
    add_index :courses, :user_id
  end
end
