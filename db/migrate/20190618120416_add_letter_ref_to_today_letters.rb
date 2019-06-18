class AddLetterRefToTodayLetters < ActiveRecord::Migration[6.0]
  def change
    add_reference :today_letters, :letter, null: false, foreign_key: true
  end
end
