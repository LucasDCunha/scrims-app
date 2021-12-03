class RemoveReferenceOnMessage < ActiveRecord::Migration[6.1]
  def change
    remove_column :messages, :team2_id_id
    remove_column :messages, :team_id_id
  end
end
