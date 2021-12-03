class ChangeTeamTable < ActiveRecord::Migration[6.1]
  def change
    remove_column :teams, :users_id
    add_reference :teams, :user, index: true
  end
end
