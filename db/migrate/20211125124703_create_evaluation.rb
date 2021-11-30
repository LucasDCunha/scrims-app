class CreateEvaluation < ActiveRecord::Migration[6.1]
  def change
    create_table :evaluations do |t|
      t.references :teams, foregin_key: true
      t.references :scrims, foregin_key: true
      t.integer :grade
      t.boolean :active
      t.timestamps
    end
  end
end
