class RemoveAuthenticatorFromUser < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :authenticator
  end
end
