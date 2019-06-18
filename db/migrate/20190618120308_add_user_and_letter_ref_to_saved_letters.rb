class AddUserAndLetterRefToSavedLetters < ActiveRecord::Migration[6.0]
  def change
    add_reference :saved_letters, :user, null: false, foreign_key: true
    add_reference :saved_letters, :letter, null: false, foreign_key: true
  end
end
