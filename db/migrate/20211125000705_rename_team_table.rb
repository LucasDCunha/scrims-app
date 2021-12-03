class RenameTeamTable < ActiveRecord::Migration[6.1]
  def change
    rename_table :team_tables, :teams
  end
end
