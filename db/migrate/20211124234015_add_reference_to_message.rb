class AddReferenceToMessage < ActiveRecord::Migration[6.1]
  def change
    add_column :message_tables, :users, :integer, foreign_key: true 
  end
end
