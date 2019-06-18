class CreateSavedLetters < ActiveRecord::Migration[6.0]
  def change
    create_table :saved_letters do |t|

      t.timestamps
    end
  end
end
