class AddAdminToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :admin, :boolean
    add_index(:users, :email, unique: true)
  end
end
