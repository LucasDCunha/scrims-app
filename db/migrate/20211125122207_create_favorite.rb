class CreateFavorite < ActiveRecord::Migration[6.1]
  def change
    create_table :favorites do |t|
      t.references :users, foreign_key: true
      t.references :teams, foreign_key: true
      t.boolean :active
      t.timestamps
    end
  end
end
