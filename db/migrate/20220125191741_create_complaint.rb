class CreateComplaint < ActiveRecord::Migration[6.1]
  def change
    create_table :complaints do |t|
      t.string :message
      t.references :team, foreign_key: true
      t.timestamps
    end
  end
end
