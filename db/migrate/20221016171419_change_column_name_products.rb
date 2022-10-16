class ChangeColumnNameProducts < ActiveRecord::Migration[6.1]
  def change
    rename_column :products, :product_name, :name
    rename_column :products, :product_description, :description
    rename_column :products, :product_price, :price


  end
end
