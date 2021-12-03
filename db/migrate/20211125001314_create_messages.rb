class CreateMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :messages do |t|
      t.date :date
      t.time :time
      t.string :content
      t.integer :team_id
      t.integer :team2_id
      t.boolean :active
      
      t.timestamps
    end
    add_foreign_key :messages, :teams, column: :team_id
    add_foreign_key :messages, :teams, column: :team2_id
  end
end
  