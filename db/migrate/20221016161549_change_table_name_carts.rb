class ChangeTableNameCarts < ActiveRecord::Migration[6.1]
  def change
    rename_table :carts, :cart_products
  end
end