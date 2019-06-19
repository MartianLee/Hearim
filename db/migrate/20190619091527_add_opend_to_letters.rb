class AddOpendToLetters < ActiveRecord::Migration[6.0]
  def change
    add_column :letters, :opened, :boolean
  end
end
