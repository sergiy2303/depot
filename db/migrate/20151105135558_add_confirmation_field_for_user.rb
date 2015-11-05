class AddConfirmationFieldForUser < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.boolean :confirmed, default: false
    end
  end
end
