class CreateTeamTable < ActiveRecord::Migration[6.1]
  def change
    create_table :team_tables do |t|
      t.references :users, foreign_key: true
      t.string :name
      t.integer :number_off_athletes
      t.integer :level
      t.float :grade
      t.boolean :active
      
      t.timestamps
    end
  end
end
