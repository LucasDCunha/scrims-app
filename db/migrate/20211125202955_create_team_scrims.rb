class CreateTeamScrims < ActiveRecord::Migration[6.1]
  def change
    create_table :team_scrims do |t|
      t.references :teams, foreign_key: true
      t.references :scrims, foreign_key: true
      t.timestamps
    end
  end
end
