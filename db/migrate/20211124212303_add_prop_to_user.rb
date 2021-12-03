class AddPropToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :authenticator, :string
    add_column :users, :active, :boolean, default: true
  end
end
