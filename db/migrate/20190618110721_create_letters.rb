class CreateLetters < ActiveRecord::Migration[6.0]
  def change
    create_table :letters do |t|
      t.text :body

      t.timestamps
    end
  end
end
