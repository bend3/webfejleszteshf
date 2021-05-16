class AddPurchasedToPurchases < ActiveRecord::Migration[6.1]
  def change
    add_column :purchases, :purchased, :boolean
  end
end
