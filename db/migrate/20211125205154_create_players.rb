class CreatePlayers < ActiveRecord::Migration[6.1]
  def change
    create_table :players do |t|
      t.string :name
      t.integer :level
      t.boolean :active
      t.references :teams, foreign_key: true
      t.timestamps
    end
  end
end
