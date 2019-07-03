# Rename Like count column
class ChangeLikeCountToLikesCountToLetters < ActiveRecord::Migration[6.0]
  def change
    rename_column :letters, :like_count, :likes_count
  end
end
