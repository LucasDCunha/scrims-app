class AddReferenceOnMessage < ActiveRecord::Migration[6.1]
  def change
    add_reference :messages, :team_id, index: true
    add_reference :messages, :team2_id, index: true
  end
end
