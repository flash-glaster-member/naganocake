class RenameCulomn < ActiveRecord::Migration[6.1]
  def change
    rename_column :carts, :customer_id
    rename_column :addresses, :customer_id
    rename_column :orders, :customer_id
  end
end
