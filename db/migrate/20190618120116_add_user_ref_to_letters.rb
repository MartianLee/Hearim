class AddUserRefToLetters < ActiveRecord::Migration[6.0]
  def change
    add_reference :letters, :user, null: false, foreign_key: true
  end
end
