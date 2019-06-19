class AddLikeCountToLetters < ActiveRecord::Migration[6.0]
  def change
    add_column :letters, :like_count, :integer, :default => 0
  end
end
