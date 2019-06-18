class AddUserAndLetterRefToLikes < ActiveRecord::Migration[6.0]
  def change
    add_reference :likes, :user, null: false, foreign_key: true
    add_reference :likes, :letter, null: false, foreign_key: true
  end
end
