class ForRemoveColumn < ActiveRecord::Migration[7.1]
  def change
    remove_column :users, :password_confirmation
  end
end
