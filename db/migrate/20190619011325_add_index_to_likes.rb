class AddIndexToLikes < ActiveRecord::Migration[6.0]
  def change
    add_index :likes, [:letter_id, :user_id], unique: true
  end
end
