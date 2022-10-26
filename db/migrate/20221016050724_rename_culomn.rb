class RenameCulomn < ActiveRecord::Migration[6.1]
  def change
    rename_column :carts, :user_id, :customer_id
    rename_column :addresses, :user_id, :customer_id
    rename_column :orders, :user_id, :customer_id
  end
end