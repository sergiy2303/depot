class UpdateUser < ActiveRecord::Migration
  def change
    rename_column :users, :email_confirmed, :confirmed
    remove_column :users, :confirm_token
  end
end
