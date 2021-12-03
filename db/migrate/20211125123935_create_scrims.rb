class CreateScrims < ActiveRecord::Migration[6.1]
  def change
    create_table :scrims do |t|
      t.date :date
      t.time :time
      t.integer :team_id
      t.integer :team2_id
      t.integer :level
      t.boolean :active
      t.timestamps
    end
  end
end
