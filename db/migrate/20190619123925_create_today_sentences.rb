class CreateTodaySentences < ActiveRecord::Migration[6.0]
  def change
    create_table :today_sentences do |t|
      t.date :day
      t.text :body
      t.timestamps
    end
  end
end
