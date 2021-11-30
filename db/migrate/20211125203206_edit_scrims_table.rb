class EditScrimsTable < ActiveRecord::Migration[6.1]
  def change
    remove_column :scrims, :team_id
    remove_column :scrims, :team2_id
  end
end
