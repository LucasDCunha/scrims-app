class CreateInviteTeams < ActiveRecord::Migration[6.1]
  def change
    create_table :invite_teams do |t|
      t.references :team, foreign_key: true
      t.references :invite, foreign_key: true
      t.timestamps
    end
  end
end
